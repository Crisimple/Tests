-- 一、Ubuntu中安装Mysql

-- 1.1 卸载安装失败的MySQL
--   sudo apt-get remove mysql-server
--   sudo apt-get autoremove mysql-server
--   sudo apt-get remove mysql-common

-- 1.2 清理MySQL残留数据
--   dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P

-- 1.3 安装MySQL
--   sudo apt-get update
--   sudo apt-get install mysql-server
--   sudo apt-get install mysql-client
--   sudo apt-get install libmysqlclient-dev
--   sudo netstat -tap | grep mysql

-- 1.4 启动MySQL服务
--   sudo /etc/init.d/mysql start

-- 1.5 配置访问IP限制
--   sudo vi /etc/mysql/mysql/mysql.conf.d
--   将bind-address=127.0.0.1 修改为 bind-address = 0.0.0.0
--   sudo /etc/init.d/mysql restart

-- 1.6 访问数据库
-- 解决密码问题：https://blog.csdn.net/qq_32799165/article/details/83574665
--   mysql -u root -h 127.0.0.1 -p
GRANT ALL PRIVILEGES ON *.* TO 'root'@''IDENTIFIED BY 'rootpassword' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- 1.7 授权管理
-- 用户管理特殊命令（PS：用户权限相关数据保存在mysql书库的user表中，不建议直接对其操作）
--   创建用户
           CREATE USER '用户名'@'IP地址' IDENTIFIED BY '密码';
--   删除用户
           DROP USER '用户名'@'IP地址';
--   修改用户
           RENAME USER '用户名'@'IP地址' TO '新用户名'@'新IP地址';
--   修改密码
           SET PASSWORD FOR '用户名'@'IP地址' = PASSWORD('新密码');
--
-- 用户权限管理(默认权限什么都没有)
--   查看权限
           SHOW GRANTS FOR '用户名'@'IP地址';
--   授权
--   权限[      ALL PRIVILEGES  除grant外的所有权限
--             SELECT          仅查权限
--             SELECT,INSERT   查和插入权限
--             ...
--             USAGE                   无访问权限
--             ALTER                   使用alter table
--             ALTER ROUTINE           使用alter procedure和drop procedure
--             CREATE                  使用create table
--             CREATE ROUTINE          使用create procedure
--             CREATE TEMPORARY TABLES 使用create temporary tables
--             CREATE USER             使用create user、drop user、rename user和revoke  all privileges
--             CREATE VIEW             使用create view
--             DELETE                  使用delete
--             DROP                    使用drop table
--             EXECUTE                 使用call和存储过程
--             FILE                    使用select into outfile 和 load data infile
--             GRANT OPTION            使用grant 和 revoke
--             INDEX                   使用index
--             INSERT                  使用insert
--             LOCK TABLES             使用lock table
--             PROCESS                 使用show full processlist
--             SHOW DATABASES          使用show databases
--             SHOW VIEW               使用show view
--             UPDATE                  使用update
--             RELOAD                  使用flush
--             SHUTDOWN                使用mysqladmin shutdown(关闭MySQL)
--             SUPER                   使用change master、kill、logs、purge、master和set global。还允许mysqladmin􏵗􏵘􏲊􏲋调试登陆
--             REPLICATION CLIENT      服务器位置的访问
--             REPLICATION SLAVE       由复制从属使用
-- ]
           GRANT INSERT(权限) ON '数据库'.'表' TO '用户'@'IP地址';
--   取消权限
           REVOKE INSERT(权限) ON '数据库'.'表' FROM '用户'@'IP地址';
-- [数据库.表:   数据库.*           (数据库中的所有表)、
--              数据库.存储过程     (指定数据库中的存储过程)
--              数据库.表          (指定数据库中的某张表)
--              *.*               (所有数据库)
-- ]

-- ['用户名'@'IP地址'         (用户只能在该IP下才能访问)
--  '用户名'@'192.168.1.%'    (用户只能在改IP段下才能访问(通配符%表示任意))
--  '用户名'@'%'              (用户可以再任意IP下访问(默认IP地址为%))

-- 1.8 忘记密码
-- 启动免授权服务端
--       mysqld --skip-grant-tables
-- 客户端
--       mysql -u root -p
-- 修改用户名和密码
      UPDATE mysql.user SET authentication_string=PASSWORD('password') WHERE user='root';
-- FLUSH PRIVILEGES;
