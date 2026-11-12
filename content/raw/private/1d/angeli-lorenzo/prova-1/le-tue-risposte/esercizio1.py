l=[5,-2,8,0,-7,3]
x=0
y=0
while y < len(l):
    if l[y] >= 0:
        x = x + l[y]
    y = y + 1
print(x)