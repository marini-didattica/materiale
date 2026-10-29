l1 = [1, 2, 3, 2, 1]
l2 = []
palindromo = True
for i in range (len(l1)-1, -1, -1):
    l2.append(l1[i])
if l1!=l2:
    palindromo=False
print(palindromo)