-- ----------------------------------------------------------------------------------------	
-- ----------------------------------------------------------------------------------------	

-- HW 07
-- Q1
	SELECT
		id,
		`date`,
		REPLACE(YEAR(`date`), ',', '') AS 'year',
		MONTH(`date`) AS 'month',
		DAY(`date`) AS 'day'
	FROM
		orders o;

-- Q2
	SELECT
		id,
		`date`,
		DATE_ADD(`date`, INTERVAL 1 DAY) AS next_day
	FROM
		orders o;

-- Q3
	SELECT
		id,
		`date`,
		UNIX_TIMESTAMP(`date`) AS timestamp_val
	FROM
		orders o;

-- Q4
	SELECT
		count(*)
	FROM
		orders o
	WHERE `date` BETWEEN '1996-07-10 00:00:00' AND '1996-10-08 00:00:00';
	
-- Q5
	DROP FUNCTION IF EXISTS create_json_obj;
    
    DELIMITER //
    
    CREATE FUNCTION create_json_obj(id INT, `date` DATE)
    RETURNS JSON
    DETERMINISTIC
    NO SQL
    BEGIN
		DECLARE final_output JSON;
        SET final_output = JSON_OBJECT('id',id, 'date',`date`);
        RETURN final_output;
    END //
    
    DELIMITER ;
	
	SELECT
		id,
		`date`,
		create_json_obj(id, `date`) AS json_obj
	FROM 
		orders o
