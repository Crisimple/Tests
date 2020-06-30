#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 经典排序集合.py
__time__    : 2020/6/30 18:07
__author__  : crisimple
__github__  : https://github.com/crisimple/  
__resume__  : None
"""

def bubble_sort(args_list):
    for i in range(len(args_list)):
        for j in range(len(args_list)-i-1):
            if args_list[j] > args_list[j+1]:
                args_list[j], args_list[j+1] = args_list[j+1], args_list[j]
    print("冒泡排序：", args_list)

def select_sort(args_list):
    for i in range(len(args_list)):
        min_num = i
        for j in range(i+1, len(args_list)):
            if args_list[j] < args_list[min_num]:
                min_num = j
        args_list[i], args_list[min_num] = args_list[min_num], args_list[i]
    print("选择排序：", args_list)
                

if __name__ == '__main__':
    list_sample = [1, 7, 9, 5, 4, 2, 8, 7]

    bubble_sort(list_sample)
    
    select_sort(list_sample)
