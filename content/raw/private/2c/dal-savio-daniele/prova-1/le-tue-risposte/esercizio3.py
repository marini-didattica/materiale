l = [1, 2, 2, 5]
a=True
for i in range (len(l)):
    if (l[i])<=(l[i]+1):
        a=a
    else:
        a=False
print(a)