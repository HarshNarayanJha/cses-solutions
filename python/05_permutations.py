n = int(input().strip())

if n == 1:
    print(1)
    exit()

if n <= 3:
    print("NO SOLUTION")
    exit()

i = 2
while i <= n:
    print(i, end=" ")
    i += 2

i = 1
while i <= n:
    print(i, end=" ")
    i += 2
