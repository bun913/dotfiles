# なんらかの答え
ans = 0
# 一番左から見始める
l = 0
r = l + 1
while l < limit:
    left = A[l]
    # 左が右に追いついてしまっている場合は右をずらす
    if l == r:
        r += 1
    # 右端を行けるまで右にずらす
    # 条件式を変更すること
    while r < N and A[r] - left <= K:
        # 答えを導くためのなんらからの処理
        # ans += r - l
        r += 1
    else:
        l += 1
print(ans)

# queを使った尺取り方
# from collections import deque

# N, K = list(map(int, input().split()))
# A = list(map(int, input().split()))
# q = deque()

# ans = 0
# for a in A:
#     q.append(a)
#     while not (a - q[0]) <= K:
#         rm = q.popleft()
#     lq = len(q)
#     ans += lq - 1
# print(ans)
