def combination(n, r) -> int:
    """
    組み合わせ数の計算
    """
    return permutation(n, r) // math.factorial(r)
