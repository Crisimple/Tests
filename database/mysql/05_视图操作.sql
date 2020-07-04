-- -*- encoding: utf-8 -*-
-- @File    :   05_视图操作.sql
-- @Time    :   2019/9/27 10:13
-- @Author  :   Crisimple
-- @Github :    https://crisimple.github.io/
-- @Contact :   Crisimple@foxmail.com
-- @License :   (C)Copyright 2017-2019, Micro-Circle
-- @Desc    :   None


-- 1. 创建视图
--  语法格式：CREATE VIEW '视图名称' AS 'SQL语句'
CREATE VIEW user_id AS
    SELECT uid FROM databases_example.user_info;

-- 2. 使用视图
-- 由于视图是虚拟表，无法对进行更新和删除，仅能做查询操作
SELECT * FROM databases_example.user_id;

-- 3. 删除视图
-- 语法格式：DROP VIEW '视图名称'
DROP VIEW databases_example.user_id;


-- 4. 修改视图
-- 语法格式：ALTER VIEW '视图名称' AS 'SQL语句'
ALTER VIEW databases_example.user_id AS
    SELECT * FROM databases_example.user_info;
