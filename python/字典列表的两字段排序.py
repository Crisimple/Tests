#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 字典列表的两字段排序.py
__time__    : 2020/7/4 12:51
__author__  : crisimple
__github__ :  https://crisimple.github.io/
"""

student_info = [
    {"name": "A", "class_a": 23, "class_b": 25},
    {"name": "B", "class_a": 25, "class_b": 29},
    {"name": "C", "class_a": 25, "class_b": 27},
    {"name": "D", "class_a": 21, "class_b": 24},
]

print(sorted(student_info, key=lambda i: (i["class_a"], i["class_b"]), reverse=False))