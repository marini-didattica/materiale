l = [3, 5, 7, 12]
a = 7

trovato = False          # ipotizza che a non ci sia
i = 0
while i < len(l):        # scorre la lista finché non trova a
    if l[i] == a:
        trovato = True
        break            # appena trovato un elemento uguale si può uscire
    i += 1

print(trovato)           # stampa soltanto True oppure False

# Con lista vuota il ciclo non parte e stampa False.
# Senza il break il programma funzionerebbe uguale, ma farebbe passi inutili.
