/*DATA TYPES IN POSTGRESQL*/

--NUMBER TYPES

SELECT 2+2; -- integer: 4

SELECT (2); --integer

SELECT (2.0); --numric

--Covert it to treat it as a different data type:
SELECT (2.0::INTEGER); --integer

SELECT (2.0::SMALLINT); --smallint

--If value is out of range = ERROR
SELECT (99999::SMALLINT); --"ERROR:  smallint out of range "

SELECT (9999999999999::INTEGER); --"ERROR:  integer out of range "
-------------------------------------------------------------------------
--REAL, DOUBLE PRECISION, FLOAT: not as accurate
SELECT (1.99999::REAL-1.99998::REAL); --1.001358e-05
									 -- 1.99999-1.99998=0.00001358
--DECIMAL and NUMERIC = accurate (100% PRECISE)
SELECT (1.99999::DECIMAL-1.99998::DECIMAL); --0.00001
SELECT (1.99999::NUMERIC-1.99998::NUMERIC); --0.00001

----------------------------------------------------------------------
--CHARACTER TYPES
SELECT ('asdfghjkl'::CHAR(3));--"asd"
SELECT ('a'::CHAR(3)); --"a  "

SELECT ('asdfghjklxcvbnmnm'::VARCHAR(5)); --""asdfg""
SELECT ('a'::VARCHAR(5));--"a"

SELECT ('SDHAGKSFHADSFGAKDSHFGALSF'::TEXT);
--"SDHAGKSFHADSFGAKDSHFGALSF"

------------------------------------------------------------------------
--BOOLEAN TYPES
SELECT ('true'::BOOLEAN); --"true"
SELECT ('y'::BOOLEAN); --"true"
SELECT ('t'::BOOLEAN); --"true"
SELECT ('1'::BOOLEAN); --"true"

SELECT ('false'::BOOLEAN); --"false"
SELECT ('no'::BOOLEAN); --"false"
SELECT ('n'::BOOLEAN); --"false"
SELECT ('0'::BOOLEAN); --"false"

SELECT (NULL:: BOOLEAN); --"[null]"
-------------------------------------------------------------------------------
--TIMES, DATES and TIMESTAMPS

--DATES
SELECT ('NOV-20-1980'::DATE); --"1980-11-20"
SELECT ('NOV 20 1980'::DATE); --"1980-11-20"
SELECT ('NOV 20,1980'::DATE); --"1980-11-20"
SELECT ('1980 Novenmber 20'::DATE); --"1980-11-20"

--TIME, time without time zone
SELECT ('01:23'::TIME); --"01:23:00"
SELECT ('01:23 PM'::TIME); --"13:23:00"
SELECT ('01:23 PM'::TIME WITHOUT TIME ZONE); --"13:23:00"
SELECT ('01:23:23 PM'::TIME WITHOUT TIME ZONE); --"13:23:23"

--TIME, time WITH time zone
SELECT ('01:23:23 AM EST'::TIME WITH TIME ZONE); --"01:23:23-05:00"
SELECT ('01:23:23 AM PST'::TIME WITH TIME ZONE); --"01:23:23-08:00"
SELECT ('01:23:23 AM Z'::TIME WITH TIME ZONE); --"01:23:23+00:00"
SELECT ('01:23:23 AM UTC'::TIME WITH TIME ZONE); --"01:23:23+00:00"

--TIMESTAMPS
SELECT ('NOV-20-1980 01:23 AM PST'::TIMESTAMP WITH TIME ZONE);
-- "1980-11-20 11:23:00+02"

--------------------------------------------------------------------------------------
--INTERVALS
SELECT ('1 day'::INTERVAL); --"1 day"
SELECT ('1 D'::INTERVAL); --"1 day"
SELECT ('1 D 20 H'::INTERVAL); -- "1 day 20:00:00"
SELECT ('1 D 20 H 34 M'::INTERVAL); -- "1 day 20:34:00"
SELECT ('1 D 20 H 34 M 45 S'::INTERVAL); -- "1 day 20:34:45"

--Can perform mathematical operations:
SELECT ('1 D 20 H 34 M 45 S'::INTERVAL) - ('1 D'::INTERVAL);
--"20:34:45"







