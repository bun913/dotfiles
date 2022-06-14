def rot_n(s, n) -> str:
    """
    アルファベットsをn文字分後にずらす
    """
    answer = ''
    for letter in s:
        answer += chr(ord('A') + (ord(letter)-ord('A')+n) % 26)
    return answer
