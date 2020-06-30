#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : sysVSos.py
__time__    : 2020/6/29 17:59
__author__  : 
__github__  : https://github.com/crisimple/  
__resume__  : None
"""
import os
import sys

os.remove('path/filename') # 删除文件
os.rename("oldname", "newname")  # 重命名文件
os.walk()  # 生成目录树下的所有文件名
os.chdir('dirname') #  改变目录
os.mkdir('dirname') # 创建目录
os.makedirs('dirname') # 创建多层目录
os.rmdir('dirname')  # 删除目录
os.removedirs('dirname')  # 删除多层目录
os.listdir('dirname')  # 列出指定目录的文件
os.getcwd()  # 取得当前工作目录
os.chmod()  # 改变目录权限
os.path.basename('path/filename')  # 去掉目录路径，返回文件名
os.path.dirname('path/filename')  # 去掉文件名，返回目录路径
os.path.join("path1[,path2[,...]]")  # 将分离的各部分组合成一个路径名
os.path.split('path')  # 返回( dirname(), basename())元组
os.path.splitext()  # 返回 (filename, extension) 元组
os.path.getatime  # 分别返回最近访问时间
os.path.ctime  # 分别返回创建时间
os.path.mtime  # 分别返回最近修改时间
os.path.getsize()  # 返回文件大小
os.path.exists()  # 是否存在
os.path.isabs()  # 是否为绝对路径
os.path.isdir()  # 是否为目录
os.path.isfile() # 是否为文件


sys.argv  #  命令行参数List，第一个元素是程序本身路径
sys.modules.keys()  #  返回所有已经导入的模块列表
sys.exc_info()  #  获取当前正在处理的异常类,exc_type、exc_value、exc_traceback当前处理的异常详细信息
sys.exit(0)  #  退出程序，正常退出时exit(0)
sys.hexversion  #  获取Python解释程序的版本值，16进制格式如：0x020403F0
sys.version  #  获取Python解释程序的版本信息
sys.maxint  #  最大的Int值
sys.maxunicode  #  最大的Unicode值
sys.modules  #  返回系统导入的模块字段，key是模块名，value是模块
sys.path  #  返回模块的搜索路径，初始化时使用PYTHONPATH环境变量的值
sys.platform  #  返回操作系统平台名称
sys.stdout  #  标准输出
sys.stdin  #  标准输入
sys.stderr #   错误输出
sys.exc_clear()  #  用来清除当前线程所出现的当前的或最近的错误信息
sys.exec_prefix  #  返回平台独立的python文件安装的位置
sys.byteorder  #  本地字节规则的指示器，big-endian平台的值是'big',little-endian平台的值是'little'
sys.copyright  #  记录python版权相关的东西
sys.api_version  #  解释器的C的API版本
# sys.stdin,sys.stdout,sys.stderr变量包含与标准I/O 流对应的流对象. 如果需要更好地控制输出,而print 不能满足要求, 它们就是所需要的. 你也可以替换它们, 这时候你就可以重定向输出和输入到其它设备( device ), 或者以非标准的方式处理它们