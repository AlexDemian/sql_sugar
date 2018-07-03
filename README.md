USAGE:
***
psql -p portnumber -d database -U user -f script_name.sql
***
Functions examples:



* array_median:
***
your_database=# select array_median(array[10,1,3,4.5]);
***
 array_median

--------------

         3.75
