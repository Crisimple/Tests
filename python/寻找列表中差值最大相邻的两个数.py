#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 寻找列表中差值最大相邻的两个数.py
__time__    : 2020/7/4 12:40
__author__  : crisimple
__github__ :  https://crisimple.github.io/
"""

def find_max_diff(A, n):
    # 定义最小的负数
    minx = -0x3f3f3f3f
    for i in range(1, n):
        if abs(A[i-1] - A[i]) > minx:
            minx = abs(A[i-1] - A[i])

    return minx

if __name__ == "__main__":
    A = [9, 30, 1, 10, 20]
    print(A)
    n = int(input("请输入列表元素的个数："))
    print(find_max_diff(A, n))