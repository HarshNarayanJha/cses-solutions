n = int(input())

while n != 1:
    print(n, end=" ")
    if n & 1 == 0:
        n >>= 1
    else:
        n *= 3
        n += 1

print(1, end="")
