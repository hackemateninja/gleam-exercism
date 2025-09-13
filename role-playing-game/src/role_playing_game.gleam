import gleam/option.{type Option}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
	case player.health, player.level {
		0, l if l >= 10 -> option.Some(Player(..player, health: 100, mana: option.Some(100)))
		0, _ -> option.Some(Player(..player, health: 100))
		_ , _-> option.None
	}
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player {
    Player(name, level, health, mana_option) ->
      case mana_option {
        option.Some(mana) -> {
          case cost <= 0 {
            True -> #(player, 0)
            False -> case mana >= cost {
              True -> {
                let remaining = mana - cost
                let damage = cost * 2
                #(Player(name, level, health, option.Some(remaining)), damage)
              }
              False -> #(player, 0)
            }
          }
        }

        option.None -> {
          case cost <= 0 {
            True -> #(player, 0)
            False -> {
              // no tiene mana: salud baja por costo
              let new_health = health - cost
              let final_health = case new_health < 0 {
                True -> 0
                False -> new_health
              }
              #(Player(name, level, final_health, option.None), 0)
            }
          }
        }
      }
  }
}