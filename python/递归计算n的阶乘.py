#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 递归计算n的阶乘.py
__time__    : 2020/7/4 12:53
__author__  : crisimple
__github__ :  https://crisimple.github.io/
"""
from functools import reduce

a = 10

b_1 = reduce(lambda x, y: x * y, range(1, a+1))
print("b_1: ", b_1)

def multiplicate(x, y):
    return x * y

b_2 = reduce(multiplicate, range(1, a+1))
print("b_2: ", b_2)

def digui(n):
    if n == 1:
        return 1
    else:
        return n*digui(n-1)
b_3 = digui(a)
print("b_3: ", b_3)

s = 1
for i in range(1, a+1):
    s = s * i
b_4 = s
print("b_4: ", b_4)