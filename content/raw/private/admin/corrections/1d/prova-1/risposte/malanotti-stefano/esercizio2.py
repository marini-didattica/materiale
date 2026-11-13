l=[3,8,1,5]
a=0
while True:
    if a==len(l):
        break
    c=l[a]
    if c<0:
        trovato=True
        break
    else:
        trovato=False
    a+=1
if trovato:
    print ("False")
else:
    print ("True")