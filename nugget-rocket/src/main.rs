//#[macro_use] extern crate rocket;

use crate::postgres_sqlx_tries::some_postgres_sqlx_tries;

mod users;
mod entities;
//mod entitiessqlite;
mod sqlite_sqlx_tries;
mod postgres_sqlx_tries;
mod postgres_seaorm_tries;
mod postgres_diesel_tries;

/*
#[rocket::launch]
fn server() -> Rocket<Build> {
    rocket::build()
        .mount("/", routes![index])
        .mount("/users", routes![get_users, get_user])
}*/

#[rocket::main]
async fn main() -> Result<(), rocket::Error> {
    let _rocket = rocket::build()
        .mount("/users", rocket::routes![users::get_users, users::get_user])
        .launch()
        .await?;

    Ok(())
}


/*#[tokyo::main] <- here you can use rocket also. seems to enable async as well
async fn main() {
    some_postgres_sqlx_tries().await.unwrap();
}
*/
