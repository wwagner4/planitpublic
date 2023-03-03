use std::env;
use std::error::Error;

use diesel::{Connection, PgConnection};
use diesel::prelude::*;
//use self::models::*;
use dotenvy::dotenv;

use crate::models::{NewPost, Post};
use crate::schema::posts::dsl::posts;
use crate::schema::posts::published;

pub(crate) fn some_postgres_diesels() /*-> Result<(), Error>*/ {
    let conn = &mut establish_connection();

    //create_post(conn, "first", "not-last?");
    //create_post(conn, "second", "another one :))");

    let results = posts
        .filter(published.eq(false))
        .limit(5)
        .load::<Post>(conn)
        .expect("Error loading Posts");

    println!("Displaying {} posts:", results.len());
    for post in results {
        println!("-----------\n");
        println!("{}", post.title);
        println!("{}", post.body);
    }

    //Ok(())
}

fn establish_connection() -> PgConnection {
    dotenv().ok();

    let database_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    PgConnection::establish(&database_url)
        .unwrap_or_else(|_| panic!("Error connecting to {}", database_url))
}

fn create_post(conn: &mut PgConnection, title: &str, body: &str) -> QueryResult<Post> {
    use crate::schema::posts;

    let new_post = NewPost { title, body };

    diesel::insert_into(posts::table)
        .values(&new_post)
        .get_result(conn)
    //.expect("Error saving new post")
}
