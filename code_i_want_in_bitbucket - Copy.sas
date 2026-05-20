** list out the in-memory tables of the caslib **;
proc casutil incaslib="casuser";
    list tables;
quit;

** list out the on-disk files of the caslib **;
proc casutil incaslib="casuser";
    list files;
quit;

** save an in-memory table to on-disk file **;
proc casutil incaslib="casuser" outcaslib="casuser";
    save casdata="HOMEEQUITY_CUSTOMER" casout="HMEQ_CUSTOMER.csv" replace;
quit;

** list out the on-disk files of the caslib **;
proc casutil incaslib="casuser";
    list files;
quit;

** drop an in-memory table;
proc casutil incaslib="casuser";
    droptable casdata="homeequity_customer" quiet;
quit;

** delete an on-disk file;
proc casutil incaslib="casuser";
    deletesource casdata = "HMEQ_CUSTOMER.csv" quiet;
quit;