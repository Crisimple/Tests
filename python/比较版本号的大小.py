#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 比较版本号的大小.py
__time__    : 2020/7/4 12:35
__author__  : crisimple
__github__ :  https://crisimple.github.io/
"""

def compare_version(args_v1, args_v2):
    # print("args_v1: ", args_v1)
    # print("args_v2: ", args_v2)
    args_v1_list = str(args_v1)
    args_v2_list = str(args_v2)
    v1 = args_v1_list.split('.')
    v2 = args_v2_list.split('.')
    for i in range(len(v1)):
        if v1[i] == v2[i]:
            # print("%s 等于 %s" % (v1[i], v2[i]))
            # compare_version(v1[i], v2[i])
            pass
        else:
            if v1[i] > v2[i]:
                print("%s 大于 %s" % (args_v1_list, args_v2_list))
            else:
                print("%s 小于 %s" % (args_v1_list, args_v2_list))


if __name__ == '__main__':
    v_1 = "1.2.3"
    v_2 = "1.26.3"
    compare_version(v_1, v_2)