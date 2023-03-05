//#[macro_use] extern crate rocket;

use sqlx::PgPool;
use crate::postgres_sqlx_tries::{connection_pool, some_postgres_sqlx_tries};

mod stops;
mod entities;
//mod entitiessqlite;
mod sqlite_sqlx_tries;
mod postgres_sqlx_tries;
mod postgres_seaorm_tries;
mod postgres_diesel_tries;

#[rocket::main]
 async fn main() -> Result<(), rocket::Error> {
     let _rocket = rocket::build()
         .mount("/", rocket::routes![stops::get_stops])
         .manage(JtfsDb {pool: connection_pool().await})
         .launch()
         .await?;
     Ok(())
 }

pub struct JtfsDb {
    pub pool: PgPool
}


/*#[rocket::main]
async fn main() {
    some_postgres_sqlx_tries().await.unwrap();
}
*/
