#variabili
n=7
count=0 
npari=0

#codice 
while count <= n:
    print(count)   
    if count %2 == 0:
        npari = npari + 1
        count = count + 1 

    count = count + 1

print (npari)

