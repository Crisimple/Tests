-- -*- encoding: utf-8 -*-
-- @File    :   06_触发器.sql
-- @Time    :   2019/9/27 10:59
-- @Author  :   Crisimple
-- @Github :    https://crisimple.github.io/
-- @Contact :   Crisimple@foxmail.com
-- @License :   (C)Copyright 2017-2019, Micro-Circle
-- @Desc    :   06_触发器.sql

-- 1. 创建触发器
-- 格式：create trigger	触发器名	触发时间(BEFORE|AFTER)	触发事件	on 表名	for each now
--      触发器触发的具体事务
-- 执行过程为：执行触发事件作用在某个表上前或后，触发器执行具体的事物
DELIMITER //
CREATE TRIGGER tri_before_insert_user_info BEFORE INSERT ON databases_example.user_info FOR EACH ROW
    BEGIN
        SELECT COUNT(*) INTO @num;
    END //
DELIMITER ;

-- 2.使用触发器
INSERT INTO databases_example.user_info(uid, name, sex, job, age, address, detail, add_col, change_col)
                                 VALUES('000016', '小C', 0, 'Programmer', 18, '北京朝阳酒仙桥', '喜欢睡觉', 20, 25);
SELECT * FROM databases_example.user_info;

-- 3.删除触发器
DROP TRIGGER tri_before_insert_user_info;


INSERT INTO databases_example.user_info(uid, name, sex, job, age, address, detail, add_col, change_col)
VALUES('000015', '小B', 0, 'Programmer', 18, '北京朝阳酒仙桥', '喜欢睡觉', 20, 25);
