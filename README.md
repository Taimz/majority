# Majority

## Local Setup

##### Pre-requisites:

* Ruby version: `2.6.5`
* Rails version: `~6.0`


##### Installation:

* `npm install`
* `bundle install`


##### Run:

* Run Rails Server: `rails s`



## Usage

* Base Path: `/api`
* Authentication Header:  
`Authorization: Token <token>`


_________________


#### Login
* Path: `/login`
* HTTP Verb: `POST`
* Authenticated? `No`
* Request structure: 
```json
{
  "username": "Username",
  "password": "Password"
}
```

_________________

#### Create User
* Path: `/users`
* HTTP Verb: `POST`
* Authenticated? `No`
* Request structure: 
```json
{
  "user": {
    "username": "Username",
    "password": "Password"
  }
}
```
* Password Format: 
    * Must contain 8 or more characters
    * Must contain a digit
    * Must contain a lower case character
    * Must contain an upper case character
    * Must contain a symbol
    
    
_________________    


#### Fetch Current User
* Path: `/users/me`
* HTTP Verb: `GET`
* Authenticated? `Yes`


_________________


#### Logout
* Path: `/logout`
* HTTP Verb: `DELETE`
* Authenticated? `Yes`


## Tests

`bundle exec rspec`
