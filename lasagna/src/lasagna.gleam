pub fn expected_minutes_in_oven(){
	40
}

pub fn remaining_minutes_in_oven(elapsed_time: Int) -> Int {
	expected_minutes_in_oven() - elapsed_time
}

pub fn preparation_time_in_minutes(layers: Int) -> Int{
	layers * 2
}

pub fn total_time_in_minutes(layers: Int, minutes_in_oven: Int) -> Int {
	preparation_time_in_minutes(layers) + minutes_in_oven
}

pub fn alarm() {
	"Ding!"
}
