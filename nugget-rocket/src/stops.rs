use rocket::{get, State};
use rocket::serde::{Deserialize, Serialize};
use rocket::serde::json::Json;
use sqlx::PgPool;
use validator::{Validate, ValidationError};
use crate::manage_database::read_stops;

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
pub async fn get_stops(pool: &State<PgPool>) -> Json<Vec<Stop>> {
    let stops = read_stops(&pool).await.unwrap();
    Json(stops)
}
