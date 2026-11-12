l = [1, 2, 2, 5]

for i in range(len(l)):
    if l[i]<=i-1:
        print("è ordinata")
    else:
        print("non è ordinata")