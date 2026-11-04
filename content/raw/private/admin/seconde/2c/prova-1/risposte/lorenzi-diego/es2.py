l = [4,6,2,9]
a = 10
b = 1
for i in range(len(l)):
    if a>l[i]and b<l[i]:
        print(True)
    elif l[i] == 0:
        print(True)
    else:
        print(False)

    