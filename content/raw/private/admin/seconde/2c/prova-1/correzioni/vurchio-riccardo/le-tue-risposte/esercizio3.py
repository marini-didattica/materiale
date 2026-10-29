l=[1, 3, 5, 4, 5, 6]
ordinata=True
for i in range(len(l) -1):
    if l[i] > l[i+1]:
        ordinata=False
print(ordinata) 