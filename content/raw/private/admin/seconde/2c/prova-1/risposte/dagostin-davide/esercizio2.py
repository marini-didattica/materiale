l = [4, 6, 2, 9]
a = 1
b = 10
r = True

if a > b:
    a, b = b, a

for i in l:
    if i < a or i > b:
        r = False

print(r)