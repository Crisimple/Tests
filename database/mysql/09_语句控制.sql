-- -*- encoding: utf-8 -*-
-- @File    :   09_语句控制.sql
-- @Time    :   2019/9/29 11:59
-- @Author  :   Crisimple
-- @Github :    https://crisimple.github.io/
-- @Contact :   Crisimple@foxmail.com
-- @License :   (C)Copyright 2017-2019, Micro-Circle
-- @Desc    :   09_语句控制.sql

-- 1. 条件语句
-- 1.1 if语句
CREATE PROCEDURE pro_fi()
BEGIN
    DECLARE i INT DEFAULT 0;
    IF i = 1 THEN
        SELECT i;
    ELSEIF i = 2 THEN
        SELECT 2;
    ELSE
        SELECT 22;
    END IF ;
END ;
CALL pro_fi();

-- 1.2 case语句
SELECT CASE WHEN uid = 11 THEN 'A'
            WHEN uid = 12 THEN 'B'
            WHEN uid = 13 THEN 'C'
        ELSE 'X' END
        AS 'test'
FROM databases_example.user_info;

-- ---------------------------------------------------------------------
-- 2. 循环语句
-- 2.1 while循环
USE databases_example;
DELIMITER //
CREATE PROCEDURE pro_while()
BEGIN
   DECLARE num INT;
   SET num = 0;
   WHILE num < 100 DO
       SELECT num;
       SET num = num + 20;
   END WHILE;
END //
DELIMITER ;
CALL pro_while();

-- 2.2 repeat循环
USE databases_example;
DELIMITER //
CREATE PROCEDURE pro_repeat()
BEGIN
    DECLARE i INT;
    SET i=0;
    REPEAT
        SELECT i;
        SET i = i + 1;
    UNTIL i<= 5
    END REPEAT;
END //
DELIMITER ;
CALL pro_repeat();

-- 2.3 loop循环
USE databases_example;
DELIMITER //
CREATE PROCEDURE pro_loop()
BEGIN
  DECLARE i INT DEFAULT 0;
  loop_label: LOOP
    SET i = i +1;
    IF i < 8 THEN
      ITERATE loop_label;
    END IF;

    IF i >= 10 THEN
      LEAVE loop_label;
    END IF;

    SELECT i;
  END LOOP;
END ;
DELIMITER ;
CALL pro_loop();

