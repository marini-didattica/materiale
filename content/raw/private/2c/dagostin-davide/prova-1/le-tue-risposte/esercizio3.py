l = [1, 2, 2, 5]
if len(l) >= 1:
    for i in l:
        if l[i] < l[i+1]:
            r = True
        else: 
            r = False
else:
    r = False