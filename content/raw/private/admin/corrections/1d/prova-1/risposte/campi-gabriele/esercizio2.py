num = [3, 8, -1, 5]
i=0
positivo=True
while i<len(num):
    if num[i]>=0:
        positivo=True
    if num[i]<0:
        positivo=False
        break
    i=i+1

print(positivo)