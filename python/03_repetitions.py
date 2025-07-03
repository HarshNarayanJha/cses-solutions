dna = input().strip()

longest = 1
t = 1
for i in range(1, len(dna)):
    if dna[i] == dna[i - 1]:
        t += 1
    else:
        longest = max(longest, t)
        t = 1

longest = max(longest, t)
print(longest)
