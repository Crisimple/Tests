#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 判断字符串是否是另一个字符串的字串.py
__time__    : 2020/7/4 12:50
__author__  : crisimple
__github__ :  https://crisimple.github.io/
"""

def children_str_in(args_str1, args_str2):
    if args_str1 in args_str2:
        print("%s 是 %s 的子字符串【正】" % (args_str1, args_str2))
    elif args_str2 in args_str1:
        print("%s 是 %s 的子字符串【反】" % (args_str2, args_str1))
    else:
        print("%s 不是 %s 的子字符串" % (args_str1, args_str2))

def children_str_find(args_str1, args_str2):
    if args_str1.find(args_str2) >= 0:
        print("%s 找到 %s 子串【正】" % (args_str1, args_str2))
    elif args_str2.find(args_str1) >= 0:
        print("%s 找到 %s 子串【反】" % (args_str2, args_str1))
    else:
        print("%s 找不到 %s 子串" % (args_str1, args_str2))


if __name__ == '__main__':
    str_1 = "abc"
    str_2 = "abcdef"

    children_str_in(str_1, str_2)
    children_str_find(str_1, str_2)

    print("abc".find('r'))