pub type Approval {
	Yes
	No
	Maybe
}

pub type Cuisine {
	Korean
	Turkish
}

pub type Genre {
	Crime
	Thriller
	Romance
	Horror
}

pub type Activity {
	BoardGame
	Chill
	Movie(Genre)
	Restaurant(Cuisine)
	Walk(Int)
}

fn rate_movie(genre: Genre) -> Approval {
	case genre {
		Crime -> No
		Thriller -> No
		Romance -> Yes
		Horror -> No
	}
}

fn rate_restaurant(cuisine: Cuisine) -> Approval {
	case cuisine {
		Korean -> Yes
		Turkish -> Maybe
	}
}

fn rate_walk(distance: Int) -> Approval {
	 case distance {
    d if d > 11 -> Yes
    d if d > 6 -> Maybe
    _ -> No
  }
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
		BoardGame -> No
		Chill -> No
		Movie(genre) -> rate_movie(genre)
		Restaurant(cuisine) -> rate_restaurant(cuisine)
		Walk(distance) -> rate_walk(distance)
	}
}
