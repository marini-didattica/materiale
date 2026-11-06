l = [0,1,2,3,4,5,6,7]
n = len(7)
x = len(0)
y = 0
while True:
    if x % 2 == 0:
        y = y
    x = x + 1
    if x == n:
        break
print (f"{y}")
