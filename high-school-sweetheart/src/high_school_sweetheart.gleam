import gleam/result
import gleam/list
import gleam/string

pub fn first_letter(name: String) -> String {
  name |>string.trim() |> string.first() |> result.unwrap("")
}

pub fn initial(name: String) -> String {
  name
	|> first_letter()
	|> string.capitalise() <> "."
}

pub fn initials(full_name: String) -> String {
  
	full_name
	|> string.split(on: " ")
	|> list.map(initial)
	|> string.join(" ")
}

pub fn main() {
	initials("Herman Morales")
}

pub fn pair(full_name1: String, full_name2: String) -> String {
  let initials1 = full_name1 |> initials
  let initials2 = full_name2 |> initials

  "\n     ******       ******\n" <>
  "   **      **   **      **\n" <>
  " **         ** **         **\n" <>
  "**            *            **\n" <>
  "**                         **\n" <>
  "**     " <> initials1 <> "  +  " <> initials2 <> "     **\n" <>
  " **                       **\n" <>
  "   **                   **\n" <>
  "     **               **\n" <>
  "       **           **\n" <>
  "         **       **\n" <>
  "           **   **\n" <>
  "             ***\n" <>
  "              *\n"
}
