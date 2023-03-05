use std::arch::x86_64::_mm_set1_epi32;
use std::env;
use std::fmt::Display;
use std::sync::Arc;
use dotenvy::dotenv;
use sqlx::{Database, Error, PgPool, Pool, Row};
use sqlx::postgres::{PgPoolOptions, PgRow};
use crate::stops::Stop;

pub(crate) async fn some_postgres_sqlx_tries() -> Result<(), Error> {
    let pool = connection_pool().await;
    for s in read_stops(&pool).await? {
        println!("- {} {}", s.id, s.name)
    };
    Ok(())
}

pub(crate) async fn connection_pool() -> PgPool {
    dotenv().ok();
    let database_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    PgPoolOptions::new().max_connections(1);
    PgPool::connect(&database_url).await.unwrap()
}

pub(crate) async fn read_stops(pool: &PgPool) -> Result<Vec<Stop>, Error> {
    let recs = sqlx::query!(
        r#"
select stop_id, stop_name from stops
limit 1000
        "#
    )
        .fetch_all(pool)
        .await?;

    let stops = recs.iter().map(|rec| {
        Stop {
            id: String::from(&rec.stop_id),
            name: String::from(&rec.stop_name),
        }
    });
    Ok(stops.collect::<Vec<_>>())
}