def findMinimalSuffix(arr):
    index = len(arr) - 1
    for i in range(len(arr) - 1, -1, -1):
        index = i
        if i == 0:
            break
        if arr[i] < arr[i - 1]:
            break
    return index


def prev_permutation(array):
    length = len(array)
    maximalSuffix = findMinimalSuffix(array)
    if maximalSuffix == 0:
        return
    y = maximalSuffix
    for i in reversed(range(maximalSuffix, length)):
        if array[i] < array[maximalSuffix - 1]:
            y = i
            break

    if y != -1:
        array[maximalSuffix - 1], array[y] = array[y], array[maximalSuffix - 1]
    array[maximalSuffix:length] = sorted(array[maximalSuffix:length], reverse=True)
    return array
