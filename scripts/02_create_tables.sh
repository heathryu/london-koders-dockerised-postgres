#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "koders" <<-EOSQL
    DROP TABLE IF EXISTS koders;

    DROP TABLE IF EXISTS work_experiences;

    DROP TABLE IF EXISTS furry_friends;

    CREATE TABLE koders(
	    id		        integer,
	    name	        varchar(50),
      gender        varchar(10),
      nationality   varchar(20)
    );

    CREATE TABLE work_experiences(
      id                  integer,
      koder_id            integer,
      company_name        varchar(20),
      location            varchar(20),
      tenure_in_months    integer,
      current             boolean
    );

    CREATE TABLE furry_friends(
	    id			    integer,
	    koder_id	  integer,
	    name		    varchar(50),
	    type		    varchar(50)
    );
EOSQL

