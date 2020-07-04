-- -*- encoding: utf-8 -*-
-- @File    :   10_存储过程.sql
-- @Time    :   2019/9/29 15:10
-- @Author  :   Crisimple
-- @Github :    https://crisimple.github.io/
-- @Contact :   Crisimple@foxmail.com
-- @License :   (C)Copyright 2017-2019, Micro-Circle
-- @Desc    :   10_存储过程.sql


-- 1. 创建储存过程
-- 1.1 无参数存储过程
DELIMITER //
CREATE PROCEDURE pro_no_para()
BEGIN
    SELECT * FROM databases_example.user_info;
END //
DELIMITER ;
CALL pro_no_para();
-- 1.2 有参数存储过程
-- 对于存储过程可接受参数，其参数有三类：
--     in     仅用于传入参数用
--     out    仅用于返回值用
--     inout  既可以传入又可以当作返回值
DELIMITER //
CREATE PROCEDURE pro_para(
    IN i1 INT,
    IN i2 INT,
    INOUT i3 INT,
    OUT o1 INT
)
BEGIN
    DECLARE temp1 INT;
    DECLARE temp2 INT DEFAULT 0;

    SET temp1 = 1;
    SET o1 = i1 + i2 + temp1 + temp2;
    SET i3 = i3 + 100;
END //
DELIMITER ;
-- 执行有参数的存储过程（注意传参顺序传值的）
SET @t1 = 4;
SET @t2 = 5;
CALL pro_para(1, 6, @t1, @t2);
SELECT @t1, @t2;


-- 2. 结果集
DELIMITER //
CREATE PROCEDURE pr4(
  IN n1 INT,
  INOUT n3 INT,
  OUT n2 INT
)
BEGIN
  DECLARE temp1 INT;
  DECLARE temp2 INT DEFAULT 0;

  SELECT * FROM databases_example.user_info;
  SET n2 = n1 + 100;
  SET n3 = n3 + n1 +100;
END //
DELIMITER ;
SET @t4 = 111;
SET @t5 = 222;
CALL pr4(100, @t4, @t5);
SELECT @t4, @t5;


-- 3. 删除存储过程
DROP PROCEDURE pro_no_para;
