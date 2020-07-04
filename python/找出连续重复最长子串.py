#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 找出连续重复最长子串.py
__time__    : 2020/7/4 12:39
__author__  : crisimple
__github__ :  https://crisimple.github.io/
"""

def longest_repetition():
    chars = input("请输入字符串：")
    if len(chars) ==0 or len(chars) == 1:
        return(chars, len(chars))
    counts = [1]*len(chars)
    for i in range(len(chars)):
        for j in range(i+1, len(chars)):
            if chars[i] == chars[j]:
                counts[i] += 1
            else:
                break
    return(chars[counts.index(max(counts))], max(counts))


longest_repetition()