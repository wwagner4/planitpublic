use rocket::{get, post, put, delete};
use rocket::serde::{Deserialize, Serialize};
use rocket::serde::json::Json;
use validator::{Validate, ValidationError};

#[derive(Deserialize, Serialize, Validate, Debug, Clone)]
#[serde(crate = "rocket::serde")]
#[validate(schema(function = "validate_user"))]
pub struct User {
    user_id: Option<u64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    user_code: Option<String>,
    #[validate(email, required)]
    email: Option<String>,
    #[validate(required)]
    first_name: Option<String>,
    #[validate(required)]
    last_name: Option<String>,
    #[validate(required)]
    internal_user: Option<bool>,
}

fn validate_user(user: &User) -> Result<(), ValidationError> {
    if user.internal_user.unwrap() && user.user_code.is_none() {
        Err(ValidationError::new("internal user must have user_code"))
    } else {
        Ok(())
    }
}

#[post("/users", data = "<user>")]
pub fn create_user(user: Json<User>) { //store: Data<AppStore>, mut user: Json<User>
}

#[get("/<user_id>")]
pub fn get_user(user_id: u64) -> Option<Json<User>> {
    //dbg!("searching user with id = ", user_id);
    dbg!(user_id);
    None
}

#[get("/")]
pub fn get_users() -> Json<Vec<User>> {
    let users = Vec::new();
    Json(users)
}

#[put("/users/<user_id>")]
pub async fn update_user(user_id: u64) {}

#[delete("/users/<user_id>")]
pub async fn delete_user(user_id: u64) {}
