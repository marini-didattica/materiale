l = [4, 6, 2, 9]
a = 10
b = 1
compresi= True
if a > b:
    a, b=b,a
for i in l:
    if i<a or i>b:
        compresi=False
        break
print(compresi)