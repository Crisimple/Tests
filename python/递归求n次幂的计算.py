#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 递归求n次幂的计算.py
__time__    : 2020/7/4 12:54
__author__  : crisimple
__github__ :  https://crisimple.github.io/
"""

def mi(x, n):
    if n == 0:
        return 1
    else:
        return x * mi(x, n-1)

if __name__ == "__main__":
    a = 2
    b = 3
    print("%s 的 %s 次方的值为：%s" % (a, b, mi(a, b)))

