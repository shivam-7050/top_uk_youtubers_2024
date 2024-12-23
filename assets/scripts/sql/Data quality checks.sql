/*

# 1. Row count check 

Count the total number of records (or rows) are in the SQL view

*/

SELECT
    COUNT(*) AS no_of_rows
FROM
    view_uk_youtubers_2024;


/*
# 2. Column count check 

Count the total number of columns (or fields) are in the SQL view

*/

SELECT
    COUNT(*) AS column_count
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_NAME = 'view_uk_youtubers_2024'


/*
# 3. Data type check

Check the data types of each column from the view by checking the INFORMATION SCHEMA view

*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_NAME = 'view_uk_youtubers_2024';


/*

# 4. Duplicate records check

-- 1. Check for duplicate rows in the view
-- 2. Group by the channel name
-- 3. Filter for groups with more than one row

*/


-- 1.
SELECT
    channel_name,
    COUNT(*) AS duplicate_count
FROM
    view_uk_youtubers_2024

-- 2.
GROUP BY
    channel_name

-- 3.
HAVING
    COUNT(*) > 1;