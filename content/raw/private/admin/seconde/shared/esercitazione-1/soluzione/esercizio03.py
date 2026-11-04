l = [1, 2, 3, 2, 1]

# Confronta le coppie simmetriche: primo con ultimo, secondo con penultimo, ...
# Una lista vuota o con un solo elemento non entra mai nel ciclo e resta palindroma.
palindroma = True
i = 0
j = len(l) - 1
while i < j:
    if l[i] != l[j]:
        palindroma = False
        break       # basta una coppia diversa per fermarsi
    i += 1
    j -= 1

print(palindroma)       # stampa soltanto True oppure False
