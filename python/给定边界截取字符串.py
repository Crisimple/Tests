#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 给定边界截取字符串.py
__time__    : 2020/6/30 16:44
__author__  : crisimple
__github__  : https://github.com/crisimple/  
__resume__  : None
"""


def cut_str(args_str, start_str, end_str):
    """
    给定边界截取字符串
    :param args_str: 被截取的字符串
    :param start_str: 截取的起始位置
    :param end_str: 截取的结束位置
    :return: 起始和结束位置的中间部分的字符串
    """
    if start_str in args_str and end_str in args_str:
        list_str = list(args_str)
        start_index = args_str.index(start_str[-1])
        end_index = args_str.index(end_str[0])
        print("start_index: ", start_index)
        print("end_index: ", end_index)
        r_cut_str = args_str[start_index+1: end_index]
        return r_cut_str


if __name__ == '__main__':
    str_sample = "abcdefgfijk"
    print(cut_str(str_sample, 'cd', 'ijk'))
