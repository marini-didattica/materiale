l = [1, 2, 3, 2, 1]
f=len(l)-1
p=0
for i in l:
    if i==l[f]:
        p+=1
    f=f-1
if p==len(l):
    print("True")
else:
    print("False")