use crate::manage_database::{connection_pool};

mod stops;
mod manage_database;

#[rocket::main]
 async fn main() -> Result<(), rocket::Error> {
     let _rocket = rocket::build()
         .mount("/", rocket::routes![stops::get_stops])
         .manage(connection_pool().await)
         .launch()
         .await?;
     Ok(())
 }
