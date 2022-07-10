from math import radians, cos, sin


def rotation_matrix(x, y, angle):
    rad = radians(angle)
    ans = (x * cos(rad) - y * sin(rad), x * sin(rad) + y * cos(rad))
    return ans
