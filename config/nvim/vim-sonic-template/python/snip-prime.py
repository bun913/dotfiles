def is_prime(n: int) -> bool:
    """
    素数判定(LogN)
    """
    for i in range(2, int(math.sqrt(n))+1):
        if n % i == 0:
            return False
    return True
