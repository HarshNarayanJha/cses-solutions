n = int(input().strip())

s = n * (n + 1) // 2
if s % 2 != 0:
    print("NO")
    exit(0)

target = s // 2

left: set[int] = set()

while target >= n:
    left.add(n)
    target -= n
    n -= 1

if target > 0:
    left.add(target)

print("YES")

print(len(left))
print(*left)

right: set[int] = set(range(1, n + 1)) - left

print(len(right))
print(*right)
