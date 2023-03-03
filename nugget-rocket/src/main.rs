//#[macro_use] extern crate rocket;

use crate::postgres_diesel_tries::some_postgres_diesels;

mod users;
mod entities;
//mod entitiessqlite;
mod sqlite_sqlx_tries;
mod postgres_sqlx_tries;
mod postgres_seaorm_tries;
mod postgres_diesel_tries;
mod schema;
mod models;

/*
#[rocket::launch]
fn server() -> Rocket<Build> {
    rocket::build()
        .mount("/", routes![index])
        .mount("/users", routes![get_users, get_user])
}*/

/*#[rocket::main]
async fn main() -> Result<(), rocket::Error> {
    let _rocket = rocket::build()
        .mount("/users", rocket::routes![users::get_users, users::get_user])
        .launch()
        .await?;

    Ok(())
}*/

/*#[tokio::main]
async fn main() {
    //sqlite_tries::some_sqlite_tries().await.unwrap();
    //postgres_sqlx_tries::some_postgres_sqlx_tries().await.unwrap();
    postgres_seaorm_tries::do_it_with_sea_orm().await.unwrap();
}*/

fn main() {
    postgres_diesel_tries::some_postgres_diesels();
}
