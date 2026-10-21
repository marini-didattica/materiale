n = 7
a = 0
b= 0
while a <= n:
    if a % 2 == 0:
        a = a+1
        b = b +1
    else:
        a = a+1
        b = b +0
if a > n:
    print (b)