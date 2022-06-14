def derot_n(s, n) -> str:
    """
    アルファベットsをn文字分戻す
    """
    answer = ''
    for letter in s:
        answer += chr(ord('Z') - (ord('Z')-ord(letter)+n) % 26)

    return answer
