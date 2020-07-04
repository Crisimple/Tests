#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 递归计算斐波拉契数列.py
__time__    : 2020/7/4 12:54
__author__  : crisimple
__github__ :  https://crisimple.github.io/
"""

def fibo(n):
    a = 0
    b = 1
    while b < 100:
        print(b, end=",")
        a, b = b, a+b

if __name__ == "__main__":
    n = 10
    fibo(n)