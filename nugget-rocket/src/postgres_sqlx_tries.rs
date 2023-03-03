use std::arch::x86_64::_mm_set1_epi32;
use std::sync::Arc;
use sqlx::{Database, Error, PgPool, Pool, Row};
use sqlx::postgres::{PgPoolOptions, PgRow};
//use entities::prelude::*;

pub(crate) async fn some_postgres_sqlx_tries() -> Result<(), Error> {
    println!("creating pool"); // PgPoolOptions::new().max_connections(5)
    let pool: PgPool = PgPool::connect("postgres://nugget:nugget@localhost:5432/postgres").await.unwrap();

    dbg!(&pool);
    get_user_cnt(&pool).await.unwrap();
    list_users(&pool).await;
    list_pg_tables(&pool).await.unwrap();

    println!("pfiati");
    Ok(())
}

#[derive(sqlx::FromRow, Debug)]
struct Cnt {
    cnt: i64,
}

async fn get_user_cnt(pool: &PgPool) -> Result<(), sqlx::Error> {
    println!("getting #users");
    let cnt = sqlx::query_as::<_, Cnt>("select count(*) as cnt from user_accounts")
        .fetch_one(pool)
        .await?;
    dbg!("#users", &cnt.cnt);
    Ok(())
}

async fn list_users(pool: &PgPool) -> Result<(), Error> {
    let recs = sqlx::query!(
        r#"
select id, user_code, first_name, last_name, email
from user_accounts
        "#
    )
        .fetch_all(pool)
        .await?;

    for rec in recs {
        println!(
            "- [{}] {}: {}",
            rec.id,
            &rec.user_code,
            &rec.email
        );
    }

    Ok(())
}

async fn list_pg_tables(pool: &PgPool) -> Result<(), Error> {
    let recs = sqlx::query!(
        r#"
select tablename, tableowner from pg_tables where schemaname = 'public'
        "#
    )
        .fetch_all(pool)
        .await?;

    dbg!(recs.len());
    for rec in recs {
        dbg!(
            &rec.tablename,
            //&rec.tableowner
        );
    }

    Ok(())
}
