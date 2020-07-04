-- -*- encoding: utf-8 -*-
-- @File    :   03_数据库基本操作.sql
-- @Time    :   2019/9/26 14:56
-- @Author  :   Crisimple
-- @Github :    https://crisimple.github.io/
-- @Contact :   Crisimple@foxmail.com
-- @License :   (C)Copyright 2017-2019, Micro-Circle
-- @Desc    :   None


-- 1.数据库操作
-- 显示数据库
SHOW DATABASES;

-- 创建数据库
-- utf-8 编码格式的数据库
CREATE DATABASE databases_example DEFAULT CHARACTER  SET utf8 COLLATE utf8_croatian_ci;
-- gbk的数据库
CREATE DATABASE databases_example DEFAULT CHARACTER  SET gbk COLLATE gbk_chinese_ci;

-- 使用数据库
USE databases_example;


-- ---------------------------------------------------
-- 2.数据库表
-- 使用表
USE databases_example;
SHOW TABLES;

-- 2.1 创建表
USE databases_example;
CREATE TABLE IF NOT EXISTS user_info(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '自增列',  -- 设置为自增，插入数据时无需设置此列，默认将自增(表中只能有一个自增列)
    uid INT NOT NULL COMMENT '用户唯一的UID',  -- 主键不允许有空值，单列它的值必须唯一，如果是多列，则其组合必须唯一
    name VARCHAR(30) NOT NULL COMMENT '用户名',
    sex INT NOT NULL COMMENT '用户性别：0男；1女',    -- 不可以为空
    job VARCHAR(30) NULL COMMENT '用户职业',    -- 可以为空
    age VARCHAR(20) NOT NULL DEFAULT '请填写' COMMENT '用户年龄',   -- 创建列时添加默认值，未指定默认值自动添加默认值
    address TEXT NOT NULL COMMENT '通信地址',
    detail TEXT NULL COMMENT '备注'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
USE databases_example;
CREATE TABLE IF NOT EXISTS sex (
  sex_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '性别id',
  sex_name VARBINARY(10) NOT NULL COMMENT '实际性别'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 2.2 删除表
-- TRUNCATE：快速清空数据表的全部数据，不会破坏表的结构
TRUNCATE TABLE databases_example.user_info;
-- DELETE：删除表的指定数据
DELETE FROM databases_example.user_info WHERE id = '11';
-- DROP：删除表，清空数据并会删除表的结构
DROP TABLE databases_example.user_info;

-- 2.3 修改表
-- 添加列
ALTER TABLE databases_example.user_info ADD add_col VARCHAR(20) COMMENT '表添加的列';
ALTER TABLE databases_example.user_info ADD add_col2 VARCHAR(20) COMMENT '修改表添加的列';
-- 删除列
ALTER TABLE databases_example.user_info DROP COLUMN add_col2;
-- 修改列信息
ALTER TABLE databases_example.user_info MODIFY COLUMN add_col INT COMMENT '表修改的列';
ALTER TABLE databases_example.user_info CHANGE COLUMN add_col2 change_col INT COMMENT '修改列名和该列的类型';
-- 添加主键
ALTER TABLE databases_example.user_info ADD PRIMARY KEY(add_col);
-- 删除主键
ALTER TABLE databases_example.user_info DROP PRIMARY KEY;
ALTER TABLE databases_example.user_info MODIFY add_col INT, DROP PRIMARY KEY;
-- 添加外键
ALTER TABLE '从表' ADD constraint '外键名称_FK_从表_主表' FOREIGN KEY '从表'('外键字段') REFERENCES '主表'('主键字段');
ALTER TABLE databases_example.user_info ADD constraint '外键名称_FK_从表_主表' FOREIGN KEY '从表'('外键字段') REFERENCES '主表'('主键字段');
-- 删除外键
ALTER TABLE databases_example.user_info DROP FOREIGN KEY '外键名称';
-- 修改默认值
ALTER TABLE databases_example.user_info ALTER add_col SET DEFAULT 1000;
-- 删除默认值
ALTER TABLE databases_example.user_info ALTER add_col DROP DEFAULT;


-- ---------------------------------------------------
-- 3. 数据类型
-- bit
-- int
-- bigint
-- decimal
-- float
-- double
-- char
-- varchar
-- text
-- mediumtext
-- longtext
-- enum
-- set
-- DATE
-- TIME
-- YEAR
-- DATETIME
-- TIMESTAMP