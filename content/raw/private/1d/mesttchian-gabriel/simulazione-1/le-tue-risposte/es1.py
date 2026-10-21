n = 7
c = 0
i = 0
while c <= n:
    if c % 2 == 0:
        c = c + 1
        i = i + 1
    else:
        c = c + 1
        i = i + 0
if c > n:
    print(i)