num=[0,1,2,3,4,5,6,7]
i=0
n=7
a=0
while i<len(num):
    if num[i] % 2==0:
        a=a+1
    i=i+1
    
print(a)