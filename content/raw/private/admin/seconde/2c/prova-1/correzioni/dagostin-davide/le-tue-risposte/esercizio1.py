l = [4, 7, 10, 3]
S = 0

for i in l:
    S = S + i

if len(l) == 0:
    print("0")
else:
    print(S/len(l))