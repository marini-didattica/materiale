#import "@preview/boxed-sheet:0.1.2": *


#let author = "Marini Mattia"
#let title = "Python — Liste e ciclo for"
#let homepage = "Liceo Russell"

#let my-colors = (
  rgb(190, 149, 196),
  rgb("#f39f71"),
  rgb(102, 155, 188),
  rgb(229, 152, 155),
  rgb("6a4c93"),
  rgb("E0A500"),
  rgb("#934c84"),
  rgb("#934c5a"),
)

#show: boxedsheet.with(
  title: title,
  homepage: homepage,
  authors: author,
  write-title: true,
  title-align: left,
  title-number: true,
  title-delta: 2pt,
  scaling-size: false,
  font-size: 5.5pt,
  line-skip: 5.5pt,
  x-margin: 10pt,
  y-margin: 30pt,
  num-columns: 4,
  column-gutter: 2pt,
  numbered-units: false,
  color-box: my-colors,
)

= Liste

#concept-block[
  #inline("Cos'è una lista")
  Una *lista* è una sequenza *ordinata* e *modificabile* di valori.

  ```python
  voti = [6, 7, 8]
  vuota = []
  mista = [1, "due", 3.0, True]
  ```

  - l'*ordine* conta: `[6, 7]` è diversa da `[7, 6]`;
  - i *duplicati* sono ammessi;
  - si accede per *posizione* (indice);
  - si può *modificare*: aggiungere, togliere, cambiare elementi.

  #inline("Accedere agli elementi")
  ```python
  voti = [6, 7, 8, 9]
  voti[0]     # 6    primo elemento
  voti[1]     # 7    secondo
  voti[3]     # 9    quarto
  voti[-1]    # 9    ultimo
  voti[-2]    # 8    penultimo
  ```

  > *N.B.* Gli indici partono da `0`. In una lista di `n` elementi gli indici validi vanno da `0` a `n - 1` (oppure da `-1` a `-n`).

  #inline("Modificare e misurare")
  ```python
  voti[1] = 10      # cambia il secondo elemento
  len(voti)         # 4 → quanti elementi
  ```

  #inline("Aggiungere elementi")
  ```python
  voti = [6, 7, 8]
  voti.append(9)        # [6, 7, 8, 9]        in fondo
  voti.insert(1, 10)    # [6, 10, 7, 8, 9]    in posizione 1
  ```

  - `append(x)` aggiunge *un* elemento in fondo;
  - `insert(i, x)` inserisce `x` *prima* della posizione `i`;
  - entrambe modificano la lista e *non restituiscono niente* (`None`).

  #inline("Togliere elementi")
  ```python
  voti = [6, 7, 8, 7]
  voti.remove(7)    # [6, 8, 7]   toglie il PRIMO 7 (per valore)
  voti.pop()        # [6, 8]      toglie e restituisce l'ultimo
  voti.pop(0)       # [8]         toglie e restituisce quello in posizione 0
  del voti[0]       # []          toglie per posizione, senza restituire
  ```

  - `remove(x)` cerca *per valore* → `ValueError` se non c'è;
  - `pop(i)` lavora *per posizione*;
  - `del` non restituisce il valore rimosso.

  #inline("Cercare")
  ```python
  7 in voti          # True / False (sicuro)
  voti.index(7)      # posizione della prima occorrenza
  voti.count(7)      # quante volte compare
  ```

  - `in` è il modo *sicuro* per chiedersi "c'è?";
  - `index(x)` dà un `ValueError` se `x` non è presente.

  #inline("Funzioni utili")
  ```python
  numeri = [3, 8, 5, 10]
  sum(numeri)       # 26
  max(numeri)       # 10
  min(numeri)       # 3
  sorted(numeri)    # [3, 5, 8, 10]  NUOVA lista
  numeri.sort()     # ordina sul posto, restituisce None
  numeri.reverse()  # inverte sul posto
  ```

  > *N.B.* `sorted()` crea una *copia* ordinata; `sort()` modifica la lista originale e restituisce `None`.
]

#colbreak()
= Ciclo for

#concept-block[
  #inline("Sintassi")
  ```python
  for variabile in sequenza:
      # corpo: ripetuto una volta per ogni elemento
  ```

  - `for` + *nome della variabile* + `in` + *sequenza* + `due punti` `:`;
  - il corpo è *indentato* (1 tab);
  - a ogni giro `variabile` assume il valore dell'elemento successivo;
  - il numero di giri è *già deciso* dalla lunghezza della sequenza.

  #inline("for su una lista")
  ```python
  voti = [6, 7, 8]
  for v in voti:
      print(v)        # 6 7 8
  ```

  `v` riceve il *valore* dell'elemento: riassegnare `v` *non* cambia la lista.

  ```python
  for v in voti:
      v = v + 1       # ✗ la lista resta [6, 7, 8]
  ```

  #inline("for su una stringa")
  ```python
  for c in "ciao":
      print(c)        # c i a o
  ```

  #inline("range() — 1 parametro")
  ```python
  range(n)        # 0, 1, 2, ..., n-1
  ```

  ```python
  for i in range(4):
      print(i)    # 0 1 2 3
  ```

  Parte da `0`, *esclude* `n`: produce esattamente `n` valori.

  #inline("range() — 2 parametri")
  ```python
  range(a, b)     # a, a+1, ..., b-1
  ```

  ```python
  for i in range(2, 6):
      print(i)    # 2 3 4 5
  ```

  `a` è *incluso*, `b` è *escluso*.

  #inline("range() — 3 parametri")
  ```python
  range(a, b, passo)    # da a a b-1, saltando di "passo"
  ```

  ```python
  for i in range(0, 10, 2):
      print(i)    # 0 2 4 6 8

  for i in range(5, 0, -1):
      print(i)    # 5 4 3 2 1
  ```

  - con passo *negativo* si conta all'indietro;
  - l'estremo `b` resta sempre *escluso*;
  - se il passo va nella direzione sbagliata, il ciclo *non fa nessun giro* (`range(0, 5, -1)` è vuoto).

  #inline("for con indice")
  ```python
  voti = [6, 7, 8]
  for i in range(len(voti)):
      print(i, voti[i])    # 0 6 | 1 7 | 2 8
  ```

  `len(voti)` = 3 → `range(3)` = `0 1 2`, cioè *tutti gli indici validi*. Serve quando bisogna *modificare* gli elementi.

  ```python
  for i in range(len(voti)):
      voti[i] = voti[i] + 1    # ✓ ora la lista cambia
  ```

  #inline("enumerate()")
  ```python
  for i, v in enumerate(voti):
      print(i, v)    # 0 6 | 1 7 | 2 8
  ```

  Scorciatoia per avere *indice e valore* insieme, senza `range(len(...))`.
]

#colbreak()
= Esempi ultra comuni

#concept-block[
  #inline("Scambiare due variabili (swap)")
  ```python
  a = 1
  b = 2
  a, b = b, a
  print(a, b)      # 2 1
  ```

  In Python non serve una variabile temporanea: la tupla a destra viene valutata *prima* delle assegnazioni.

  ```python
  temp = a         # versione "classica", equivalente
  a = b
  b = temp
  ```

  #inline("Controllare se un numero è pari")
  `%` è il *resto* della divisione: `n % 2` vale `0` se `n` è pari.

  ```python
  n = 8
  if n % 2 == 0:
      print("pari")
  else:
      print("dispari")
  ```

  #inline("Scorrere tutti i numeri da 1 a n")
  ```python
  n = 5
  for i in range(1, n + 1):
      print(i)      # 1 2 3 4 5
  ```

  > *N.B.* `n + 1` perché l'estremo destro di `range()` è *escluso*. Con `range(1, n)` ti fermeresti a `n - 1`.

  #inline("Scorrere una lista con due indici")
  Un indice `i` parte da *sinistra*, uno `j` da *destra*: si avvicinano fino a incontrarsi.

  ```python
  v = [1, 2, 3, 4, 5]
  i = 0
  j = len(v) - 1
  while i < j:
      v[i], v[j] = v[j], v[i]    # scambia gli estremi
      i = i + 1
      j = j - 1
  print(v)      # [5, 4, 3, 2, 1]
  ```

  Con un `for` si fanno *metà* dei giri e `j` si calcola da `i`:

  ```python
  v = [1, 2, 3, 4, 5]
  for i in range(len(v) // 2):
      j = len(v) - 1 - i
      v[i], v[j] = v[j], v[i]
  ```

  > *N.B.* `len(v) // 2` e non `len(v) / 2`: `range()` vuole un *intero*, e `/` produce un `float`.

  #inline("Pattern: accumulatore")
  Una variabile inizializzata *prima* del ciclo e aggiornata *dentro*.

  ```python
  numeri = [3, 8, 5, 10]

  somma = 0
  for n in numeri:
      somma = somma + n
  print(somma)          # 26

  massimo = numeri[0]
  for n in numeri:
      if n > massimo:
          massimo = n
  print(massimo)        # 10
  ```

  #inline("Pattern: costruire una lista filtrata")
  ```python
  numeri = [3, 8, 5, 10]
  pari = []
  for n in numeri:
      if n % 2 == 0:
          pari.append(n)
  print(pari)           # [8, 10]
  ```
]

#colbreak()
= Errori ultra comuni

#concept-block[
  #inline("Indice fuori range → IndexError")
  ```python
  voti = [6, 7, 8]
  voti[3]     # ✗ IndexError: list index out of range
  voti[2]     # ✓ ultimo elemento
  voti[-1]    # ✓ ultimo elemento
  ```

  Con `n` elementi l'ultimo indice è `n - 1`, *non* `n`.

  #inline("Modificare la lista mentre la scorri")
  ```python
  for v in voti:
      if v < 6:
          voti.remove(v)    # ✗ salta elementi
  ```

  Togliere elementi *sposta* gli indici successivi e il `for` va avanti lo stesso: alcuni elementi non vengono controllati. Usa una *nuova lista*:

  ```python
  ok = []
  for v in voti:
      if v >= 6:
          ok.append(v)      # ✓
  ```

  #inline("append() vs extend()")
  ```python
  v = [1, 2]
  v.append([3, 4])    # [1, 2, [3, 4]]   una lista dentro la lista

  v = [1, 2]
  v.extend([3, 4])    # [1, 2, 3, 4]     gli elementi uno per uno
  ```

  `append()` aggiunge *un solo* elemento: se è una lista, resta una lista annidata.

  #inline("`sort()` restituisce None")
  ```python
  v = [3, 1, 2]
  v = v.sort()        # ✗ v diventa None
  v.sort()            # ✓ ordina sul posto
  ordinata = sorted(v)  # ✓ nuova lista ordinata
  ```

  Vale anche per `append()`, `insert()`, `remove()`, `reverse()`: modificano la lista e *non restituiscono* la lista.

  #inline("remove() per valore, pop() per posizione")
  ```python
  voti = [6, 7, 8]
  voti.remove(1)    # ✗ ValueError: 1 non è un valore della lista
  voti.pop(1)       # ✓ toglie l'elemento in posizione 1 → 7
  ```

  #inline("range(): estremo escluso e passo")
  ```python
  range(5)            # 0 1 2 3 4      (non 5!)
  range(1, 5)         # 1 2 3 4        (non 5!)
  range(0, 5, -1)     # vuoto: passo negativo ma estremi crescenti
  range(5, 0, 1)      # vuoto: passo positivo ma estremi decrescenti
  ```

  Chiediti sempre: l'estremo destro è *incluso*? E il passo va nella *direzione giusta*?

  #inline("range() vuole un intero")
  ```python
  range(len(v) / 2)     # ✗ TypeError: / produce un float
  range(len(v) // 2)    # ✓ // produce un int
  ```

  #inline("Dimenticare i due punti `:` o l'indentazione")
  ```python
  for i in range(3)     # ✗ SyntaxError: expected ':'
      print(i)

  for i in range(3):
  print(i)              # ✗ IndentationError
  ```

  Vale per `for`, `if`, `while`, `def`.

  #inline("Altri classici")
  - *Modificare `v` nel `for`*: `for v in lista: v = v + 1` non tocca la lista.
  - *Usare `i` fuori dal ciclo*: dopo il `for` la variabile esiste ancora e vale l'*ultimo* valore.
  - *Nome sbagliato*: `lista.apend(5)` → `AttributeError` (attenzione a `append`).
  - *`=` invece di `==`* dentro un `if`: `if n % 2 = 0:` → `SyntaxError`.
  - *Lista vuota*: `max([])` e `lista[0]` danno errore; controlla prima con `len(lista) > 0`.
  - *Confondere lista nuova e stessa lista*: `b = a` non copia, `b = a.copy()` (o `a[:]`) sì.
]
