l = [5, -2, 8, 0, -7, 3]
a = 0
b = 0
while b < len(l):
    if l[b] >= 0:
        a = a + l[b]
    b = b + 1

print(a)