l = [1,2,5,3,5,4]
a=l[0]
e=0
o=l[0]
for i in l:
    if i>a:
        a=i
        e=i
l.remove(a)
print(l)
for h in l:
    if h>o or h==o:
        if h==a:
            l.remove(h)
print(o)