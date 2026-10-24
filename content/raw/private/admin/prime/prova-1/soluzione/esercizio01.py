l = [4, 7, 4, 1, 4]
a = 4

conteggio = 0        # quante volte a è stato trovato finora
i = 0                # indice dell'elemento corrente
while i < len(l):    # scorre tutta la lista fino all'ultimo elemento
    if l[i] == a:    # l'elemento corrente è uguale ad a
        conteggio += 1
    i += 1           # passa all'elemento successivo

print(conteggio)     # stampa soltanto il numero di occorrenze

# Funziona anche con una stringa al posto di un numero:
# con l = ["a", "b", "a"] e a = "a" stampa 2.
# Con lista vuota il ciclo non viene mai eseguito e stampa 0.
