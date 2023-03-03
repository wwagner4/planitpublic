use sea_orm::{ConnectOptions, Database, DatabaseConnection, DbErr};
use crate::entities::prelude::UserAccounts;

pub(crate) async fn do_it_with_sea_orm() -> Result<(), DbErr> {
    let mut opt = ConnectOptions::new("postgres://nugget:nugget@localhost:5432/postgres".to_owned());
    let db: DatabaseConnection = Database::connect(opt).await?;

    /* ??? no function 'find_by_id' ???
        let user = UserAccounts::find_by_id(1).one(db).await?;
        if let Some(u) = user{
            dbg!(u.email);
        }
    */
    Ok(())
}
