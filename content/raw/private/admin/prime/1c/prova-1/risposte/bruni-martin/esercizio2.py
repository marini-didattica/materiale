l = [3, 5, 7, 12]
a = 7
i = 0
ok = True
if len(l) == 0:
    ok = False
else:
    while i < len(l):
        if l[i] == a:
            ok = True
            break
        else:
            ok = False
            i = i + 1
print(ok)