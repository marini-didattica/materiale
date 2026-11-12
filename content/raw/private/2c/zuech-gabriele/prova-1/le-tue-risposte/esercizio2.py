l = [4, 6, 2, 9]
a = 10
b = 1
if b>a:
    a, b = b, a
for i in l:
    if not(b<=i<=a):
        print("False")
        quit()
print("True")
