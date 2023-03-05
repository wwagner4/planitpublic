use rocket::{get, post, put, delete};
use rocket::serde::{Deserialize, Serialize};
use rocket::serde::json::Json;
use validator::{Validate, ValidationError};

#[derive(Deserialize, Serialize, Validate, Debug, Clone)]
#[serde(crate = "rocket::serde")]
#[validate(schema(function = "validate_stop"))]
pub struct Stop {
    pub id: String,
    pub name: String,
}

fn validate_stop(_stop: &Stop) -> Result<(), ValidationError> {
    Ok(())
}

#[get("/stops")]
pub fn get_stops() -> Json<Vec<Stop>> {
    let stops = read_stops_from_database();
    Json(stops)
}

fn read_stops_from_database() -> Vec<Stop> {
    // TODO here comes the database call
    vec!(
        Stop { id: String::from("a"), name: String::from("Wien") },
        Stop { id: String::from("b"), name: String::from("Villach") },
    )
}
