import gleam/int
import gleam/float
import gleam/string

pub fn pence_to_pounds(pence) {
  int.to_float(pence) /. 100.0
}

pub fn pounds_to_string(pounds) {
  string.append("£", float.to_string(pounds))
}
