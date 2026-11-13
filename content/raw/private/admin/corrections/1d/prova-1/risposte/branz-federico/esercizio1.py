l = [5, -2, 8, 0, -7, 3]
a = len(l)
n = 0
i = 0
while i <= a:
    if l[i] >= 0:
        n = n + l[i]
    else: 
        break
    i = i+ i

print( n)