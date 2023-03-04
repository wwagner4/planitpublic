use std::arch::x86_64::_mm_set1_epi32;
use std::env;
use std::fmt::Display;
use std::sync::Arc;
use dotenvy::dotenv;
use sqlx::{Database, Error, PgPool, Pool, Row};
use sqlx::postgres::{PgPoolOptions, PgRow};

pub(crate) async fn some_postgres_sqlx_tries() -> Result<(), Error> {
    let pool = connection_pool().await;
    list_stops(&pool).await;
    Ok(())
}

async fn connection_pool() -> PgPool {
    dotenv().ok();
    let database_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    PgPoolOptions::new().max_connections(1);
    PgPool::connect(&database_url).await.unwrap()
}

async fn list_stops(pool: &PgPool) -> Result<(), Error> {
    let recs = sqlx::query!(
        r#"
select stop_id, stop_name from stops
limit 10
        "#
    )
        .fetch_all(pool)
        .await?;

    for rec in recs {
        println!(
            "{:20}|{}",
            rec.stop_id,
            rec.stop_name,
        );
    }

    Ok(())
}

fn f<T: Display>(opt: &Option<T>) -> String {
    match opt {
        Some(a) => format!("{a}"),
        None => String::from("-"),
    }

}

