#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 设计微信抢红包程序.py
__time__    : 2020/7/4 12:37
__author__  : crisimple
__github__ :  https://crisimple.github.io/
"""

import random

def grab_red_envelope(total_money, total_people):
    each=[]
    rest=total*100
    restpeople=division
    for i in range(0, division):
        if rest==0:
            print('done')
        else:
            money=random.randint(1,int((rest/restpeople)*2)-1)
            restpeople-=1
            rest-=money
            each.append(money)
            print('the %d player get %.2f yuan'%(i, money/100))
    each.append(rest)

if __name__ == "__main__":
    total = float(input("红包金额："))
    division = int(input("群总人数："))
    grab_red_envelope(total, division)