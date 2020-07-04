#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 完全数.py
__time__    : 2020/7/4 12:53
__author__  : crisimple
__github__ :  https://crisimple.github.io/
"""

def judge_perfect_num(num):
    s = 0
    for i in range(1, num):
        if num % i == 0  and i < num:
            s += i
    if s == num:
        return num
    else:
        pass


if __name__ == "__main__":
    perfect_num = []
    for i in range(1, 1000):
        j = judge_perfect_num(i)
        if j is not None:
            perfect_num.append(j)
    print("1000以内的完全数数有：", perfect_num)