SELECT *
FROM btc.customer_master;

-- first thing we want to do is create a staging table. This is the one we will work in and clean the data. We want a table with the raw data in case something happens
CREATE TABLE btc.customer_master_staging
LIKE btc.customer_master;

SELECT *
FROM btc.customer_master
ORDER BY CustomerName;