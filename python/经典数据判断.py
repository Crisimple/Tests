#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 经典数据判断.py
__time__    : 2020/6/30 19:01
__author__  : 
__github__  : https://github.com/crisimple/  
__resume__  : None
"""

def sxh(args):
    args_list = list(str(args))
    s = 0
    for i in args_list:
        s += int(i) ** len(args_list)
    if s == args:
        print("{}是水仙花数".format(args))

def judge_perfect_num(num):
    s = 0
    for i in range(1, num):
        if num % i == 0 and i < num:
            s += i
    if s == num:
        print("%s 是完备数" % num)


if __name__ == '__main__':
     sxh(153)