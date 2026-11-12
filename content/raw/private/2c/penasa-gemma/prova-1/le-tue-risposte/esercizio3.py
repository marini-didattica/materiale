l = [1, 2, 2, 5]
crescente=True
n=l[0]
for i in l:
    if i>=n:
        n=i
    else:
        crescente=False
print(crescente)