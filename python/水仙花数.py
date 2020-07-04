#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 水仙花数.py
__time__    : 2020/7/4 12:52
__author__  : crisimple
__github__ :  https://crisimple.github.io/
"""

def judge_sxh(num):
    m = list(str(num))
    s = 0
    for i in m:
        s += int(i) ** len(m)
    if num == s:
        return num
    else:
        pass


if __name__ == "__main__":
    sxh = []
    for i in range(100, 1000):
        j = judge_sxh(i)
        if j is not None:
            sxh.append(j)
    print("100-999之间所有的水仙花数有：", sxh)