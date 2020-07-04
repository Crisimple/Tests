#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 判断两个json是否相等.py
__time__    : 2020/7/4 12:52
__author__  : crisimple
__github__ :  https://crisimple.github.io/
"""

import json_tools

def compare_json(args_src, args_dst):
    if isinstance(args_src, dict):
        for key in args_src:
            if key not in args_dst:
                print("args_dst 不存在 %s" % key)
        for key in args_dst:
            if key in args_src:
                if args_dst[key] == args_src[key]:
                    compare_json(args_dst[key], args_src[key])
                else:
                    print("args_src[%s]=%s 不等于 args_dst[%s]=%s" % (key, args_src[key], key, args_dst[key]))
            else:
                print("args_dst 不存在 %s key" % key)
    elif isinstance(args_src, list):
        args_src.sort()
        args_dst.sort()
        if len(args_src) == len(args_dst):
            for key in range(0, len(args_src)):
                if args_src[key] == args_dst[key]:
                    compare_json(args_src[key], args_dst[key])
                else:
                    print("args_sr=%s 不等于 args_dst=%s" % (args_src, args_dst))
        else:
            print("args_sr=%s 不等于 args_dst=%s" % (args_src, args_dst))
    else:
        if str(args_src) == str(args_dst):
            print("%s 等于 %s" % (args_src, args_dst))
        else:
            print("%s 不等于 %s" % (args_src, args_dst))

def compare_json_py(args_src, args_dst):
    result = json_tools.diff(args_src, args_dst)
    print(result)



if __name__ == '__main__':
    json1 = {
        "a": 1,
        "c": [11, 22, 33, {
            'c1': 111,
            'c2': 222
        }],
        "b": [1, 2, 4]
    }
    json2 = {
        "a": 1,
        "b": [1, 2, 4],
        "c": [11, 22, 33, {
            'c1': 111
        }]
    }
    list1 = [1, 2, 3, 4]
    list2 = [4, 3, 2, 1]

    compare_json(json1, json2)
    compare_json_py(json1, json2)