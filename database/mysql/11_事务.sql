-- -*- encoding: utf-8 -*-
-- @File    :   11_事务.sql
-- @Time    :   2019/9/29 15:41
-- @Author  :   Crisimple
-- @Github :    https://crisimple.github.io/
-- @Contact :   Crisimple@foxmail.com
-- @License :   (C)Copyright 2017-2019, Micro-Circle
-- @Desc    :   None

-- 1.创建事务
DELIMITER //
CREATE PROCEDURE pro_transaction(
    OUT p_return_code tinyint
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
           -- ERROR
            SET p_return_code = 1;
            ROLLBACK ;
        END ;

    DECLARE EXIT HANDLER FOR SQLWARNING
        BEGIN
            -- warning
            SET p_return_code = 2;
            ROLLBACK ;
        END ;

    START TRANSACTION ;
        INSERT INTO databases_example.user_info(uid, name, sex, job, age, address, detail, add_col, change_col)
                VALUES('000015', '事务', 0, 'Programmer', 18, '北京朝阳酒仙桥', '喜欢睡觉', 20, 25);
    COMMIT ;

    -- success
    SET p_return_code = 0;
END //
DELIMITER ;


-- 2.执行事务
SET @i = 0;
CALL pro_transaction(@i);
SELECT @i;

SELECT * FROM databases_example.user_info;