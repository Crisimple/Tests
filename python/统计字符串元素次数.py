#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 统计字符串元素次数.py
__time__    : 2020/6/30 16:30
__author__  : 
__github__  : https://github.com/crisimple/  
__resume__  : None
"""


def count_item(args_str):
    """
    统计字符串元素次数
    :param args_str: 要统计的字符串对象
    :return: 返回各个元素的出现的次数
    """
    args_str = args_str.replace(" ", "")
    count_dict = {}
    for i in args_str:
        if i in count_dict:
            count_dict[i] = args_str.count(i)
        else:
            count_dict[i] = 1
    return count_dict


if __name__ == '__main__':
    str_sample = " abc1@2321!!78 uabd "
    print(count_item(str_sample))


