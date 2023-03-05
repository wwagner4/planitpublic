use rocket::{get, post, put, delete, State};
use rocket::serde::{Deserialize, Serialize};
use rocket::serde::json::Json;
use sqlx::PgPool;
use validator::{Validate, ValidationError};
use crate::JtfsDb;
use crate::postgres_sqlx_tries::read_stops;

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
pub async fn get_stops(pool: &State<JtfsDb>) -> Json<Vec<Stop>> {
    println!("--- in get stops with pool");
    let stops = read_stops_from_database(&pool.pool).await;
    Json(stops)
}

async fn read_stops_from_database(pool: &PgPool) -> Vec<Stop> {
    read_stops(pool).await.unwrap()
}
