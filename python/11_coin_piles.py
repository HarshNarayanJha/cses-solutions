n = int(input().strip())

for _ in range(n):
    a, b = map(int, input().strip().split())

    if (a + b) % 3 == 0 and min(a, b) * 2 >= max(a, b):
        print("YES")
    else:
        print("NO")
