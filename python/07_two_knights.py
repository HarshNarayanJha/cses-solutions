n = int(input().strip())


for k in range(1, n + 1):
    ways = int(k**2 * (k**2 - 1) / 2 - 4 * (k - 2) * (k - 1))
    print(ways)
