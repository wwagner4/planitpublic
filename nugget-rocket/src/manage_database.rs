use std::env;
use dotenvy::dotenv;
use sqlx::{Error, PgPool};
use sqlx::postgres::{PgPoolOptions};
use crate::stops::Stop;

pub(crate) async fn connection_pool() -> PgPool {
    dotenv().ok();
    let database_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    PgPoolOptions::new().max_connections(5);
    PgPool::connect(&database_url).await.unwrap()
}

pub(crate) async fn read_stops(pool: &PgPool) -> Result<Vec<Stop>, Error> {
    let recs = sqlx::query!(
        r#"
select stop_id, stop_name from stops
limit 10
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