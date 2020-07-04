#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 计算文件中相似行数据的平均值.py
__time__    : 2020/7/4 12:38
__author__  : crisimple
__github__ :  https://crisimple.github.io/
"""

#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 统计文件中的数据.py
__time__    : 2020/7/1 15:36
__author__  : 
__github__  : https://github.com/crisimple/  
__resume__  : None
cat goods_price.log
id name price1 price2
1 mp3 10 11
2 mP3 20 21
3 Mp3 30 31
4 MP3 40 41
5 tv1 100 101
6 tV1 200 201
7 Tv1 300 301
8 TV1 400 401
9 TV1 400 401
"""
import re

def goods_count():
    with open('goods_price.log', 'r', encoding='utf-8') as f:
        next(f)
        lines = f.readlines()
        mp_3 = re.compile(r'mp3', re.I)
        tv_1 = re.compile(r'tv1', re.I)
        goods_dict = {}
        goods_price_dict = {}
        mp3_count = 0
        mp3_count_price = 0
        tv1_count = 0
        tv_1_count_price = 0
        for line in lines:
            line_list = list(line.rstrip('\n').split(' '))
            if mp_3.match(line_list[1]):
                mp3_count += 1
                mp3_count_price += float(line_list[2])
                goods_dict['mp3'] = mp3_count
                goods_price_dict['mp3'] = mp3_count_price
            elif tv_1.match(line_list[1]):
                tv1_count += 1
                tv_1_count_price += float(line_list[2])
                goods_dict['tv1'] = tv1_count
                goods_price_dict['tv1'] = tv_1_count_price

        avg_dict = {}
        for index, item in goods_dict.items():
            avg_price = goods_price_dict[index] / item
            avg_dict[index] = avg_price
        print(avg_dict)


if __name__ == '__main__':
    goods_count()