use std::arch::x86_64::_mm_set1_epi32;
use std::sync::Arc;
use sqlx::{Database, Error, Pool, Row, SqlitePool};
use sqlx::sqlite::SqliteRow;
//use entitiessqlite::prelude::*;

pub(crate) async fn some_sqlite_sqlx_tries() -> Result<(), Error> {
    println!("creating pool");
    let pool: SqlitePool = SqlitePool::connect("sqlite:///home/walpod/projects/free-com/nugget/nugget-users.sqlite").await.unwrap();

    dbg!(&pool);
    get_user_cnt(&pool).await?;
    //list_users(&pool).await?;

    println!("pfiati");
    Ok(())
}

#[derive(sqlx::FromRow, Debug)]
struct Cnt {
    cnt: i32,
}

async fn get_user_cnt(pool: &SqlitePool) -> Result<(), sqlx::Error> {
    println!("getting #users");
    let cnt = sqlx::query_as::<_, Cnt>("select count(*) as cnt from user_accounts")
        .fetch_one(pool)
        //.map(|row: SqliteRow| row.get(0))
        .await?;
    dbg!(&cnt.cnt);
    Ok(())
}

/*
async fn list_users(pool: &SqlitePool) -> Result<(), Error> {
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
            "- [{}] {}, {}",
            rec.id,
            &rec.user_code,
            &rec.email
        );
    }

    Ok(())
}
*/