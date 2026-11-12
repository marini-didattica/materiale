l = [1, 2, 2, 5]
f=1
for i in l:
    if f>len(l)-1:
            break
    if i>l[f]:
        print("False")
        quit()
    f+=1
print("True")