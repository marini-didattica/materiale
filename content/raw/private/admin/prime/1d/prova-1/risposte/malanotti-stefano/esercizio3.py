l=[7,-3,12,0,5,-8]
a=0
b=0
h=0
if len(l)==0:
    print("0, la lista è vuota: non esiste né un massimo né un minimo")
elif len(l)==1:
    print(f"{l[a]}, con un solo elemento, massimo e minimo coincidono")

while True:
    if a==len(l):
        break
    c=l[a]
    b+=c
    b-=c
    if c>b:
        d=c
    if c<b:
        e=c
    h+=1
    b+=c
    if h>=2:
        a+=1
print (f"il valore più grande è {d}, il più piccolo è {e}")