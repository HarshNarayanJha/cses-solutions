n = int(input())
nums = map(int, input().strip().split(" "))
print(f"{n * (n + 1) / 2 - sum(nums):.0f}")
