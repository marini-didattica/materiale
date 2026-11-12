l = [1, 2, 2, 5]
n=l[0]
ordinata=True
for i in l:
    if i >= n:
        n=i
    else:
        ordinata=False
print(ordinata)