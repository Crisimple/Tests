-- -*- encoding: utf-8 -*-
-- @File    :   04_数据库增删改查.sql
-- @Time    :   2019/9/26 17:43
-- @Author  :   Crisimple
-- @Github :    https://crisimple.github.io/
-- @Contact :   Crisimple@foxmail.com
-- @License :   (C)Copyright 2017-2019, Micro-Circle
-- @Desc    :   None

-- 1. 增
-- 基本语法：INSERT INTO table_name(clo1, clo2, ..., clon) VALUES(value1, value2, ..., valuen);
INSERT INTO databases_example.user_info(uid, name, sex, job, age, address, detail, add_col, change_col)
VALUES ('000011', '小A', 0, 'Programmer', 19, '北京朝阳酒仙桥', '喜欢睡觉', 20, 25),
       ('000012', '小B', 0, 'Programmer', 18, '北京朝阳酒仙桥', '喜欢睡觉', 20, 25),
       ('000013', '小B', 0, 'Programmer', 18, '北京朝阳酒仙桥', '喜欢睡觉', 20, 25);

-- 2. 删
-- 基本语法：DELETE FROM table_name;
DELETE FROM databases_example.user_info WHERE id=1;
TRUNCATE TABLE databases_example.sex;
DROP TABLE databases_example.sex;

-- 3. 改
-- 基本语法：UPDATE table_name SET name='要修改内容' WHERE id=1;
UPDATE databases_example.user_info SET name='AA' WHERE id=1;

-- 4. 查
-- 基本语法：
SELECT * FROM databases_example.user_info WHERE id>1;
-- 【条件】
SELECT * FROM databases_example.user_info WHERE id>1;
SELECT * FROM databases_example.user_info WHERE id BETWEEN 2 AND 5;
SELECT * FROM databases_example.user_info WHERE id IN(2, 4, 6);
SELECT * FROM databases_example.user_info WHERE id NOT IN(2, 4, 6);
SELECT * FROM databases_example.user_info WHERE id IN(SELECT uid FROM user_info );
-- 【通配符】
SELECT * FROM databases_example.user_info WHERE name LIKE '小%';  -- 开头的所有（多个字符串）
SELECT * FROM databases_example.user_info WHERE name LIKE '小_';  -- ale开头的所有（一个字符）
-- 【限制（分页）】
SELECT * FROM databases_example.user_info LIMIT 3;                   -- 前三行
SELECT * FROM databases_example.user_info LIMIT 4, 5;                -- 从第4行开始后的5行
SELECT * FROM databases_example.user_info LIMIT 2 OFFSET 2;          -- 从第2行开始后的1行
-- 【排序】
SELECT * FROM databases_example.user_info ORDER BY id ASC;     -- 根据 “列” 从小到大排列
SELECT * FROM databases_example.user_info ORDER BY id DESC;     -- 根据 “列” 从大到小排列
SELECT * FROM databases_example.user_info ORDER BY id DESC, uid ASC;     -- 根据 “列1” 从大到小排列，如果相同则按列2从小到大排序
-- 【分组】
-- 特别的：group by 必须在where之后，order by之前
SELECT id FROM databases_example.user_info WHERE id > 1 GROUP BY age;
-- 【连表】
-- 无对应关系则不显示
SELECT A.id, A.name, B.sex_name FROM databases_example.user_info AS A, databases_example.sex AS B WHERE A.nid = B.nid;
-- 无对应关系则不显示
SELECT A.id, A.name, B.sex_name FROM databases_example.user_info AS A INNER JOIN databases_example.sex AS B ON A.id = B.sex_id;
-- A表所有显示，如果B中无对应关系，则值为null
SELECT A.id, A.name, B.sex_name FROM databases_example.user_info AS A LEFT JOIN databases_example.sex AS B ON A.id = B.sex_id;
-- B表所有显示，如果B中无对应关系，则值为null
SELECT A.id, A.name, B.sex_name FROM databases_example.user_info AS A RIGHT JOIN databases_example.sex AS B ON A.id = B.sex_id;
-- 【组合】
-- 组合，自动处理重合
SELECT name FROM databases_example.user_info AS A UNION SELECT sex_name FROM databases_example.sex AS B;
-- 组合，不处理重合
SELECT name FROM databases_example.user_info AS A UNION ALL SELECT sex_name FROM databases_example.sex AS B;
