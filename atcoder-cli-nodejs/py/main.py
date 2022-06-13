# -*- coding: utf-8 -*-
"""
Atcoderの問題解く用

1行1列データ

#str型で受け取るとき
s = input()
#int型で受け取るとき
s = int(input())
#float型　(小数)で受け取るとき
s = float(input())

(1,N)行列データ
s = input().split()
# listで整数で受け取る
l = list(map(int, input().split()))

その他
https://qiita.com/jamjamjam/items/e066b8c7bc85487c0785

全ての組み合わせを列挙する方法
list(0...8)から2つを抜き出す
list(combinations(l, 2))
"""
from functools import reduce
from itertools import combinations
import math

# 素数判定


def is_prime(n: int) -> bool:
    """
    素数判定(LogN)
    """
    for i in range(2, int(math.sqrt(n))+1):
        if n % i == 0:
            return False
    return True


def permutation(n, r) -> int:
    """
    順列の計算
    """
    return math.factorial(n) // math.factorial(n-r)


def combination(n, r) -> int:
    """
    組み合わせ数の計算
    """
    return permutation(n, r) // math.factorial(r)


def rot_n(s, n) -> str:
    """
    アルファベットsをn文字分後にずらす
    """
    answer = ''
    for letter in s:
        answer += chr(ord('A') + (ord(letter)-ord('A')+n) % 26)
    return answer


def derot_n(s, n) -> str:
    """
    アルファベットsをn文字分戻す
    """
    answer = ''
    for letter in s:
        answer += chr(ord('Z') - (ord('Z')-ord(letter)+n) % 26)

    return answer
