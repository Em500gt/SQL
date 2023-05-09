use homework;

-- 1
DELIMITER //
CREATE FUNCTION format_time(in_seconds INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE d INT;
    DECLARE h INT;
    DECLARE m INT;
    DECLARE s INT;
    DECLARE result VARCHAR(50);

    SET d = FLOOR(in_seconds / 86400);
    SET h = FLOOR((in_seconds % 86400) / 3600);
    SET m = FLOOR(((in_seconds % 86400) % 3600) / 60);
    SET s = ((in_seconds % 86400) % 3600) % 60;

    SET result = CONCAT(d, ' days ');
    SET result = CONCAT(result, h, ' hours ');
    SET result = CONCAT(result, m, ' minutes ');
    SET result = CONCAT(result, s, ' seconds');

    RETURN result;
    
END //
DELIMITER ;

SELECT format_time(123456);

-- 2
DELIMITER // 
CREATE PROCEDURE hw()
BEGIN
	DECLARE d INT DEFAULT 2;
    WHILE d <= 10 DO
		SELECT d;
        SET d = d + 2;
    END WHILE;
END //
DELIMITER ;

CALL hw();



















