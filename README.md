# Fantatic Forum
The exclusive platform for heroes. 


To Do:
- [x] add documentation on adding Swagger for controllers/model 
- [ ] add rest of controllers to swagger
- [x] add curl documentation
- [x] add documentation for running tests
- [x] update frontpage

Key components:

* Rails ( in API mode )
* Using JWT Tokens ( via [knock](https://github.com/nsarno/knock) )
* API documentation using [Swagger](https://swagger.io/)
* Development environment in Docker / Docker Compose

### Quick Start

First checkout the repository and build your docker

```
$ git clone https://github.com/cfitz/fantastic-forum.git 
$ docker-compose build
```

* Note: You will need to run build after you add gems to the Gemfile. 

Now create your DB and seed it with some data:

```
$ docker-compose run web rails db:create db:migrate db:seed
```

* Note: After creating the DB, Linux users might need to correct permission by
  running 'sudo chown -R $USER:$USER .' 

Start the application:

```
$ docker-compose up
```

You should be able to see that the app is running on http://localhost:3000 with
Swagger documentation at http://localhost:8080


Running tests:

```
$ docker-compose run web rails test
```

Code coverage files will be added to the 'coverage' directory. 

## Interacting with the application

* The following assumes you run the db:seed task to load dummy data into the
  app.

To see all available routes in the API, run:

```
$ docker-compose run web rake routes
```

The API is namespaced under the /api route and is versioned ( currently at
/api/v1 ).

Most actions require a JWT token ( more on that below ), with the exception of viewing topics:

```
$ curl http://localhost:3000/api/v1/topics 
$ curl http://localhost:3000/api/v1/topics?page=2 
$ curl http://localhost:3000/api/v1/topics/1 
``

For Create/Update/Delete functions, users need to authenticate, which you will
need a JWT token for. Check the login.json file for the format of JSON needed
to authenticate. 

```
$ TOKEN=$(curl  -H "Content-Type: application/json" --data @login.json http://localhost:3000/api/v1/user/token | python -c "import sys, json; print json.load(sys.stdin)['jwt']") 
$ echo $TOKEN
eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTMzNTY2NTYsInN1YiI6MX0.ug-MHL0-DGpEw42vQHfV8WB6CR-mgPJ9jOZlmKeQmgM
```

The result is your bearer token that you can use in the API:

```
$ AUTH="Authorization: Bearer $TOKEN"
$ curl -X POST -H "Content-Type: application/json" -H $AUTH --data @topic.json
http://localhost:3000/api/v1/topics
$ curl -X DELETE -H "Content-Type: application/json" -H $AUTH --data @topic.json
http://localhost:3000/api/v1/topics
$ curl -X PATCH -H "Content-Type: application/json" -H $AUTH --data @topic.json
http://localhost:3000/api/v1/topics/3
```


## Documentation with Swagger-UI

[Swagger-UI](https://swagger.io/) is a popular framework for documenting APIs.
Included are some helper methods to add swagger documentation to the code,
which will result in having [openapi
3.0.0](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md) complient JSON being exported in the
/api endpoint. 

The DSL used to create this JSON is provided by the [swagger-blocks](https://github.com/fotinakis/swagger-blocks) gem

To document controllers, create a corresponding module with a superclass named
"Swagger". For example, for Api::V1::TopicsController, create a module named
Api::V1::Swagger::TopicsController ( in the swagger directory ). Then in your
controller include the Swaggable concern. This will automatically bootstrap
your controller to be exported in the openapi JSON.

For models, the process is similar: Create a Swagger superclassed module that
matches you Model class ( for Topic this would be Swagger::Topic ), then
include SwaggerModel in your Model class. 

This will this be available in the Swagger app ( running on
http://localhost:8080 )
