# README

## APP SET UP

* Set up database:
    ```
    docker-compose up -d
    ```
* Install dependencies:
    ```
    bundle install
    ```
* Create database:
    ```
    bin/rails db:create
    ```
* Run server:
    ```
    bin/rails server
    ```

## Scaffold

* After creating the tables with scaffold you need to do the migration:
   ```
    bin/rails db:migrate
    ``` 
