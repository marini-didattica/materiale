l=[5,-2,8,0,-7,3]
a=0
b=0
while True:
    if a==len(l):
        break
    c=l[a]
    if c<=0:
        a+=1
    if c>0:
        a+=1
        b+=c
print (f"{b}")
