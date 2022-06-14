import math

def permutation(n, r) -> int:
    """
    順列の計算
    """
    return math.factorial(n) // math.factorial(n-r)
