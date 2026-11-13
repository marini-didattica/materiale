l = [4,7,4,1,4]
a = 4
i = 0
ripetizione = 0
while i < len(l):
    if l[i] == a:
        ripetizione = ripetizione + 1
    i = i + 1
print(ripetizione)