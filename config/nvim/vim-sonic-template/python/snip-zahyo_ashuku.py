# Aという配列を座標圧縮する
# A = list(map(lambda ab: ab[0], AB))
a_temp = sorted(set(A))
ad = {v: i for i, v in enumerate(a_temp)}
ans_a = list(map(lambda v: ad[v] + 1, A))
