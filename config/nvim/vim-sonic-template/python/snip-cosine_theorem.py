from math import radians, sqrt, cos


def cosine_theorem(a, b, angle):
    '''
    預言定理
    aとbという三角形の2辺とその間の角度から3辺目の長さがわかる
    '''
    rad = radians(angle)
    _cos = cos(rad)
    c_square = (a ** 2) - (2 * a * b * _cos) + (b ** 2)
    c = sqrt(c_square)
    return c
