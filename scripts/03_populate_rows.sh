#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "koders" <<-EOSQL
    INSERT INTO koders VALUES
	    (1, 'Hyeonwoo', 'M', 'New Zealand'),
	    (2, 'Jihyun', 'F', 'South Korea'),
	    (3, 'Jungyoung', 'F', 'United Kingdom'),
      (4, 'Taeim', 'F', 'South Korea');

    INSERT INTO work_experiences VALUES
	    (1, 1, 'Fiserv', 'New Zealand', 57, false),
	    (2, 1, 'Air New Zealand', 'New Zealand', 21, false),
	    (3, 1, 'Education First', 'United Kingdom', 13, false),
	    (4, 1, 'Credit Karma', 'United Kingdom', 15, false),
	    (5, 1, 'Tractable', 'United Kingdom', 8, true),
      (6, 2, 'LG CNS', 'South Korea', 41, false),
      (7, 2, 'MyTutor', 'United Kingdom', 9, false),
      (8, 2, 'Credit Karma', 'United Kingdom', 14, true),
      (9, 3, 'Lloyds Banking Group', 'United Kingdom', 42, true),
      (10, 4, 'The Blucean', 'South Korea', 20, false),
      (11, 4, 'Printerpix', 'United Kingdom', 10, false),
      (12, 4, 'Blackwell''s', 'United Kingdom', 12, true);

    INSERT INTO furry_friends VALUES
	    (1, 2, 'Moongchi', '🐶'),
	    (2, 2, 'Poori', '🐶'),
	    (3, 2, 'Yami', '🐱'),
      (4, 2, 'Mochi', '🐱'),
      (5, 3, 'Dali', '🐱');
EOSQL