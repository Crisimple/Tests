-- -*- encoding: utf-8 -*-
-- @File    :   07_索引.sql
-- @Time    :   2019/9/29 10:15
-- @Author  :   Crisimple
-- @Github :    https://crisimple.github.io/
-- @Contact :   Crisimple@foxmail.com
-- @License :   (C)Copyright 2017-2019, Micro-Circle
-- @Desc    :   None


-- 1.普通索引
SELECT * FROM databases_example.user_info;
-- 创建表的时候创建索引
USE databases_example;
CREATE TABLE index_table(
    nid INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    name VARCHAR(20) NOT NULL ,
    email VARCHAR(30) NOT NULL ,
    -- 注意：对于创建索引时如果是 BLOB 和 TEXT 类型，必须指定length。
    -- create index ix_extra on in1(extra(32));
    INDEX ix_name(name)
);
-- 令一种创建索引的方式
CREATE INDEX ix_nid ON index_table(nid);
-- 删除索引
DROP INDEX ix_name ON index_table;
-- 查看创建的索引
SHOW INDEX FROM databases_example.index_table;


-- 2.唯一索引
USE databases_example;
CREATE TABLE unique_table(
    nid INT NOT NULL AUTO_INCREMENT ,
    name VARCHAR(20) NOT NULL ,
    email VARCHAR(20) NOT NULL ,
    extra TEXT ,
    UNIQUE ix_nid(nid)

);
-- 另一种创建唯一索引的方法
CREATE UNIQUE INDEX ix_nid ON databases_example.unique_table(nid) ;
-- 查看创建的唯一索引
SHOW INDEX FROM databases_example.unique_table;
-- 删除唯一索引
DROP INDEX ix_name ON databases_example.unique_table;


-- ---------------------------------------------------------------------------
-- 3. 主键索引
USE databases_example;
CREATE TABLE primary_table(
    nid INT NOT NULL AUTO_INCREMENT ,
    name VARCHAR(20) NOT NULL ,
    email VARCHAR(30) NOT NULL ,
    PRIMARY KEY (nid) ,
    INDEX ix_nid(name)
);
-- 查看创建的主键索引
SHOW INDEX FROM databases_example.primary_table;
-- 另一种创建方法
CREATE INDEX ix_name ON databases_example.primary_table(name);
-- 删除主键索引
ALTER TABLE databases_example.primary_table DROP PRIMARY KEY;
ALTER TABLE databases_example.primary_table MODIFY INT, DROP PRIMARY KEY;


-- ---------------------------------------------------------------------------
-- 4. 组合索引
USE databases_example;
CREATE TABLE mixture_table(
    nid INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    name VARCHAR(20) NOT NULL ,
    email VARCHAR(20) NOT NULL
);
-- 创建索引
CREATE INDEX ix_nid_name ON mixture_table(nid, name);
-- 查看组合索引
SHOW INDEX FROM mixture_table;
-- 删除组合索引
DROP INDEX ix_nid_name ON mixture_table;
