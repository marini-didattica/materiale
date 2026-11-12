l = [4, 7, 4, 1, 4]
a = 4
i = 0
r = 0
while i < len(l):
    if l[i] == a:
        r = r + 1
    i = i + 1
print(r)