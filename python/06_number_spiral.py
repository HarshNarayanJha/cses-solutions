for _ in range(int(input().strip())):
    y, x = map(int, input().strip().split(maxsplit=1))
    if x == y == 1:
        print(1)
    elif x > y:
        if x % 2 != 0:
            print(x**2 - y + 1)
        else:
            print((x - 1) ** 2 + y)
    else:
        if y % 2 == 0:
            print(y**2 - x + 1)
        else:
            print((y - 1) ** 2 + x)
