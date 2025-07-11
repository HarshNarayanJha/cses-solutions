n = int(input().strip())

z = 0
i = 1

while True:
    k = n // 5**i
    if k < 1:
        break
    z += k
    i += 1

print(z)
