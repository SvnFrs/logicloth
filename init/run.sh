#!/bin/bash

# change user to postgres
su - postgres

# create the database
createdb dacfood

# run the script to create the tables and adding the data
psql dacfood < /docker-entrypoint-initdb.d/postgres.sql