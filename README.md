# Fantatic Forum
The exclusive platform for heroes. 

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





