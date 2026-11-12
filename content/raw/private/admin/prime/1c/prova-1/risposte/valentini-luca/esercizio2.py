l = [3, 5, 7, 12]
a = 7
x=0
trovato=False

while x < len(l) :
    if (l[x]) == (a):
        trovato=True
    
    x=x+1

if trovato:
    print("lista rispettata")
else:
    print ("lista non rispettata")