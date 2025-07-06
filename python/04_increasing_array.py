n = int(input().strip())
nums = list(map(int, input().strip().split(" ")))


moves = 0
for i in range(1, n):
    if (diff := nums[i] - nums[i - 1]) < 0:
        nums[i] += -diff
        moves += -diff
        nums[i] = nums[i - 1]


print(moves)
