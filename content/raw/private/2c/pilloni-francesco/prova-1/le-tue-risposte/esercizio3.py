l=[1,2,2,5]
ordinata=True
for i in range(len(l)):
    if i==0:
        ordinata=True
    elif l[i]<l[i-1]:
        ordinata=False
        break
print(ordinata)