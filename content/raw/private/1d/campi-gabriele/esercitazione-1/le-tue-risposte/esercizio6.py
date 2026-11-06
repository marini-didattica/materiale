num=[3,5,7,12]
i=0
a=1
b=10
compreso=True
while i<len(num):
    if num[i] > b:
        compreso=False
    if num[i] < a:
        compreso=False
    i=i+1

print(compreso)