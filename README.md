# Ruby code to access RethinkDB

A simple Ruby code to access RethinkDB and perform CRUD actions. Also, the code has a 'real-time change feed' to get all changes in database.

## Programming Language and libraries used to solve the problems

  - Ruby v2.4.1

Main libraries:
  - rethinkdb v2.3.0.2
  
### Running the code with RethinkDB in Docker
- Start RethinkDB container
```sh
$ docker run --name rethinkdb -v "$PWD:/data" -p 28015:28015 -d rethinkdb
```
- Get Docker container IP to access RethinkDB Web UI
```sh
$ docker inspect --format '{{ .NetworkSettings.IPAddress }}' rethinkdb
```
- Access RethinkDB Web UI - ```rethinkdb_ip:8080```

- Run ruby codes to create a table/collection, insert documents, select, update, and/or delete them
    - e.g. ```ruby src/create.rb```
    - To enable console change-feed, use ```ruby src/changefeed.rb```
    - These actions could all be done using Web UI