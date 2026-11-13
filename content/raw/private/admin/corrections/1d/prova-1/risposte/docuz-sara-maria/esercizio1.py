l = [5, -2, 8, 0, -7, 3]
somma= 0 
i = 0 

while i <= len(l):
    if l[i] % 2 == 0:
       somma = somma + 1 
    i = i + 1 

else:
    if l[i] % 2 != 0:
        print(0)