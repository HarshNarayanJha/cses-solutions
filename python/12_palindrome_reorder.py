from collections import Counter

line = input().strip()
n = len(line)

choices = Counter(line)

left: list[str] = []

while choices.total() > 0:
    lt, c = choices.most_common(1)[0]
    if c >= 2:
        left.extend([lt] * (c // 2))
        choices.subtract(lt * (c // 2) * 2)
    elif c == 1:
        # must be last
        left.append(lt)
        choices.subtract(lt)
        break

if max(choices.values()) == 0:
    print("".join(left), end="")
    left.reverse()
    if n & 0x1 == 0:
        print("".join(left))
    else:
        print("".join(left[1:]))
else:
    print("NO SOLUTION")
