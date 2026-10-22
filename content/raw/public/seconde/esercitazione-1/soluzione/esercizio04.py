l = [1, 2, 3, 4, 5]

# massimo è il valore più grande visto finora.
# secondo è il più grande valore strettamente minore di massimo.
massimo = l[0]
secondo = None

for x in l[1:]:
    if x > massimo:
        secondo = massimo
        massimo = x
    elif x != massimo and (secondo is None or x > secondo):
        # x è un valore distinto e può diventare il nuovo secondo massimo.
        # Il controllo x != massimo ignora le ripetizioni del massimo.
        secondo = x

print(secondo)       # stampa soltanto il secondo valore più grande
