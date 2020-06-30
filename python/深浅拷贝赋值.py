#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
__file__    : 深浅拷贝赋值.py
__time__    : 2020/6/29 16:53
__author__  : crisimple
__github__  : https://github.com/crisimple/  
__resume__  : None
"""

"""
   浅拷贝
   copy.copy()只拷贝父对象，不拷贝内部对象的子对象（不管拷贝多复杂，只拷贝第一层）
"""
import copy

list_sample = [1, 2, 3, [4, 5]]
list_copy = copy.copy(list_sample)
print("list_sample: ", list_sample)
print("list_copy: ", list_copy)

# 我们可以通过id来获取两个列表对象的内存地址，查看拷贝不同层级的内存分配情况
print("list_sample_id: ", id(list_sample))
print("list_copy_id: ", id(list_copy))
print("list_sample_id: ", id(list_sample[3]))
print("list_copy_id: ", id(list_copy[3]))

# 第一层源数据改变：源列表 list_sample 数据更改，增加数值；list_sample的值改变，list_copy的值不改变
list_sample.append(6)
print("list_sample: ", list_sample)
print("list_copy: ", list_copy)
# 第一层拷贝数据改变：list_copy 数据更改，增加数值 list_copy.append(66), list_copy 数值改变，而 list_sample 的值不变
list_copy.append(777)
print("list_sample: ", list_sample)
print("list_copy: ", list_copy, "\n")

# 第二层数据改变
list_sample_2 =  [1, 2, 3, [4, 5]]
list_copy_2 = copy.copy(list_sample_2)
print("list_sample_2: ", list_sample_2)
print("list_copy_2: ", list_copy_2)
# 第二层源数据改变
list_sample_2[3].append(222)
print("list_sample_2: ", list_sample_2)
print("list_copy_2: ", list_copy_2)
# 第二层拷贝数据改变
list_copy_2[3].append(222333)
print("list_sample_2: ", list_sample_2)
print("list_copy_2: ", list_copy_2)

"""
   深拷贝
   copy.deepcopy() --- 完全拷贝了父对象及其子对象
"""
list_deep1 = [1, 2, [3, 4]]
list_deep_copy1 = copy.deepcopy(list_deep1)
print("list_deep1: ", list_deep1)
print("list_deep_copy1: ", list_deep_copy1, '\n')

# 第一层源数据改变，不会影响拷贝数据
list_deep1.append(29)
print("list_deep1: ", list_deep1)
print("list_deep_copy1: ", list_deep_copy1)
# 第一层拷贝数据改变，不影响源数据
list_deep_copy1.append(291)
print("list_deep1: ", list_deep1)
print("list_deep_copy1: ", list_deep_copy1, '\n')

# 第二层数据改变，不会影响拷贝数据
list_deep1[2].append(291)
print("list_deep1: ", list_deep1)
print("list_deep_copy1: ", list_deep_copy1)
# 第二层拷贝数据改变，不影响源数据
list_deep_copy1[2].append(2922)
print("list_deep1: ", list_deep1)
print("list_deep_copy1: ", list_deep_copy1)

"""
    直接赋值
    相当于对象的引用，新起了一个别名；引用和原对象都指向同一对象
"""
a = [1, 2, 3, [4, 5, 6]]
b = a
print("a: ", a)
print("b: ", b, '\n')

# 第一层数据改变
a.append(111)
print("a: ", a)
print("b: ", b, '\n')
# 第一层赋值数据改变
b.append(222)
print("a: ", a)
print("b: ", b, '\n')


# 第二层数据改变
a[3].append(777)
print("a: ", a)
print("b: ", b, '\n')
# 第二层赋值数据改变
b[3].append(888)
print("a: ", a)
print("b: ", b, '\n')