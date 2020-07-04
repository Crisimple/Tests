-- -*- encoding: utf-8 -*-
-- @File    :   08_函数.sql
-- @Time    :   2019/9/27 15:40
-- @Author  :   Crisimple
-- @Github :    https://crisimple.github.io/
-- @Contact :   Crisimple@foxmail.com
-- @License :   (C)Copyright 2017-2019, Micro-Circle
-- @Desc    :   None


-- 1.创建函数
DELIMITER //
CREATE FUNCTION f1(
    i1 INT,
    i2 INT
)
RETURNS INT
BEGIN
    DECLARE num INT;
    SET num = i1 + i2;
    RETURN(num);
END //
DELIMITER ;


-- 2.执行函数
SELECT f1(2,3) AS add_result;


-- 3.删除函数
DROP FUNCTION f1;