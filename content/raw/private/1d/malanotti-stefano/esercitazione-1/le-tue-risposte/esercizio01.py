n=10
a=0
b=0
while True:
    if b%2==0:
        a=a+1
    b=b+1
    if n<b:
        break
print (f"{a}")