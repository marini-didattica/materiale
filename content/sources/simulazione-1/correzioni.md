# Correzioni — Simulazione verifica 1

Riferimento: `marini-mattia/` (110/110).

Le correzioni individuali sono in
`content/1d/<studente>/simulazione-1/le-tue-risposte/correzione.typ`. Il voto in
decimi si ottiene da `min(totale, 100) / 10`: i primi 100 punti valgono il voto,
mentre i 10 punti successivi valgono la lode. La sufficienza (6/10) corrisponde
quindi a 60/110.

## Criteri di valutazione

- **Teoria (20 punti):** domanda 1 = 7, domanda 2 = 8, domanda 3 = 5.
- **Scrittura del codice (60 punti):** esercizio 1 = 10, esercizio 2 = 20, esercizio 3 = 30.
- **Lettura del codice (30 punti):** frammento 1 = 10, frammento 2 = 10, frammento 3 = 10.

Ho assegnato crediti parziali quando l'impostazione logica era corretta, ma ho penalizzato codice non eseguibile, output errato o soluzioni non generalizzabili. Le parti mancanti valgono 0. Per riferimento, la sufficienza (6/10) corrisponde a 60/110.

## Riepilogo

| Studente | Teoria /20 | Codice /60 | Lettura /30 | Totale /110 | % |
|---|---:|---:|---:|---:|---:|
| Barbaro-Arturo | 12 | 29 | 0 | **41** | 37,3% |
| bertolini-florian | 0 | 0 | 0 | **0** | 0,0% |
| branz-federico | 9,5 | 30 | 0 | **39,5** | 35,9% |
| campi-gabriele | 9,5 | 32 | 12 | **53,5** | 48,6% |
| Chris Lorenzoni(1) | 0 | 0 | 0 | **0** | 0,0% |
| dalpiaz-damian | 0 | 5 | 0 | **5** | 4,5% |
| Docuz.Sara.Maria | 0 | 0 | 6,5 | **6,5** | 5,9% |
| gabriel_mesttchian | 0 | 30 | 0 | **30** | 27,3% |
| laccona.alessandromassimo | 0 | 0 | 0 | **0** | 0,0% |
| Lorenzo_Angeli | 7,5 | 0 | 0 | **7,5** | 6,8% |
| Lorenzo Quatrale | 3 | 1 | 0 | **4** | 3,6% |
| malanotti-stefano | 12 | 10 | 0 | **22** | 20,0% |
| melis-riccardo | 0 | 0 | 0 | **0** | 0,0% |
| midjaiti_elif | 7 | 0 | 0 | **7** | 6,4% |
| milena fondriest(1) | 6 | 5 | 0 | **11** | 10,0% |
| pellegrini-benedetta | 3,5 | 0 | 0 | **3,5** | 3,2% |
| Rosati-Martino | 9,5 | 0 | 0 | **9,5** | 8,6% |
| Valentinelli-Aurora | 7,5 | 22 | 18 | **47,5** | 43,2% |

**Media della classe:** 16,0/110 (14,5%).

### Osservazioni generali

- Solo `campi-gabriele` e `Valentinelli-Aurora` hanno consegnato tutte e tre le parti; nessuno raggiunge la sufficienza (60/110).
- La parte di lettura è quella più frequentemente assente o incompleta.
- Gli errori ricorrenti nel codice sono: liste fisse al posto di `n`, off-by-one (`i < n` invece di `i <= n`), cicli infiniti per mancato incremento e confusione tra `%` e `/`.
- In teoria ricorrono confusione tra RAM e memoria di massa, descrizioni generiche del codice binario e definizioni vaghe di istruzione/instruction set.

---

## Dettaglio per studente

### Barbaro-Arturo — 41/110

- **Teoria:** Q1 7/7, Q2 3/8, Q3 2/5 → 12/20.
- **Codice:** E1 9/10, E2 20/20, E3 0/30 → 29/60.
- **Lettura:** L1 0/10, L2 0/10, L3 0/10 → 0/30.
- **Note:** Q1 buona: sei componenti con scopi corretti. Q2 cita binario e byte, ma la parte su caratteri/parole è confusa. Q3 è troppo sintetica. E1 usa una formula corretta, ma con `n` dispari stampa un float (`4.0` invece di `4`). E2 è corretto e generale. E3 e tutta la parte di lettura mancano.

### bertolini-florian — 0/110

- **Teoria:** 0/20. File vuoti.
- **Codice:** 0/60. L'unico contenuto è `list=[0,1,2,3,4,5,6]`, senza algoritmo né output.
- **Lettura:** 0/30. Assente.
- **Note:** Consegna quasi completamente vuota.

### branz-federico — 39,5/110

- **Teoria:** Q1 6,5/7, Q2 3/8, Q3 0/5 → 9,5/20.
- **Codice:** E1 10/10, E2 20/20, E3 0/30 → 30/60.
- **Lettura:** 0/30.
- **Note:** Q1 buona (cinque componenti), con lieve imprecisione sulla scheda madre. Q2 confonde la rappresentazione binaria dei numeri con la disposizione in memoria, ma la parte su caratteri e parole è accettabile. Q3 assente. E1 ed E2 sono corretti e generali. Mancano E3 e la lettura.

### campi-gabriele — 53,5/110

- **Teoria:** Q1 6,5/7, Q2 3/8, Q3 0/5 → 9,5/20.
- **Codice:** E1 5/10, E2 12/20, E3 15/30 → 32/60.
- **Lettura:** L1 10/10, L2 2/10, L3 0/10 → 12/30.
- **Note:** Q1 raggiunge il minimo di cinque componenti con scopi validi. Q2 tratta solo i caratteri, non i numeri. Q3 assente. E1 ed E2 hanno la logica corretta ma usano liste fisse (`0..7` e `0..10`) e non sfruttano `n`: funzionano solo con l'input del template. E3 scandisce correttamente la lista, ma usa valori fissi e non gestisce il caso `a > b`. L1 è completa e corretta. L2 sbaglia l'output (`8 8` invece di `8 5`) e non comprende lo scambio. L3 assente.

### Chris Lorenzoni(1) — 0/110

- **Teoria:** 0/20. Assente.
- **Codice:** 0/60. `es1.py` contiene solo `n = 7`, `es2.py` è vuoto.
- **Lettura:** 0/30. Assente.

### dalpiaz-damian — 5/110

- **Teoria:** 0/20. Assente.
- **Codice:** E1 5/10, E2 0/20, E3 0/30 → 5/60.
- **Lettura:** 0/30. Assente.
- **Note:** E1 conta correttamente i pari, ma su una lista fissa `0..6` e non su `n`. E2 stampa i numeri da 0 a 9 invece di calcolare la somma. E3 è vuoto.

### Docuz.Sara.Maria — 6,5/110

- **Teoria:** 0/20. Assente.
- **Codice:** E1 0/10, E2 0/20, E3 0/30 → 0/60.
- **Lettura:** L1 3/10, L2 0/10, L3 3,5/10 → 6,5/30.
- **Note:** E1 controlla `n % 2` invece di `i % 2`, quindi non conta i pari dell'intervallo. E2 non incrementa `i` e non stampa nulla: va in ciclo infinito. E3 usa `len[l]` e non è eseguibile. L1 intuisce lo scorrimento della lista, ma sbaglia la condizione e non riporta l'output. L2 è vuota. L3 comprende il ruolo di `%` e dei pari, ma non riporta l'output e parla di "conteggio" invece di stampa.

### gabriel_mesttchian — 30/110

- **Teoria:** 0/20. File vuoto.
- **Codice:** E1 10/10, E2 20/20, E3 0/30 → 30/60.
- **Lettura:** 0/30. Assente.
- **Note:** E1 ed E2 sono corretti, generali e con output giusto. Mancano teoria, E3 e lettura.

### laccona.alessandromassimo — 0/110

- **Teoria:** 0/20. File vuoti.
- **Codice:** 0/60. E1 stampa `2 4 6` invece del conteggio; E2 ha un errore di sintassi e non è eseguibile; E3 è vuoto.
- **Lettura:** 0/30. File vuoti.

### Lorenzo_Angeli — 7,5/110

- **Teoria:** Q1 4,5/7, Q2 3/8, Q3 0/5 → 7,5/20.
- **Codice:** E1 0/10, E2 0/20, E3 0/30 → 0/60.
- **Lettura:** 0/30. Assente.
- **Note:** Q1 elenca solo quattro componenti (il minimo è cinque). Q2 è molto generica. E1 stampa i pari invece di contarli e, per l'indentazione, va in ciclo infinito. E2 non incrementa `i` e non stampa. E3 confronta una lista con un intero e dà `TypeError`.

### Lorenzo Quatrale — 4/110

- **Teoria:** Q1 3/7, Q2 0/8, Q3 0/5 → 3/20.
- **Codice:** E1 1/10, E2 0/20, E3 0/30 → 1/60.
- **Lettura:** 0/30. Assente.
- **Note:** Q1 confonde RAM e ROM e considera l'hardware come componente. Q2 e Q3 mancano. E1 usa `n/2` invece di `n%2` e stampa `1`; E2 non calcola la somma e non stampa. E3 e lettura mancano.

### malanotti-stefano — 22/110

- **Teoria:** Q1 5/7, Q2 5/8, Q3 2/5 → 12/20.
- **Codice:** E1 10/10, E2 0/20, E3 0/30 → 10/60.
- **Lettura:** 0/30. Assente.
- **Note:** Q1 elenca cinque componenti, ma usa "CAM" al posto di RAM e ha qualche imprecisione. Q2 è discreta: binario, byte e caratteri, senza virgola mobile. Q3 è confusa e non definisce davvero l'instruction set. E1 è corretto e generale. Mancano E2, E3 e lettura.

### melis-riccardo — 0/110

- **Teoria:** 0/20. Assente.
- **Codice:** 0/60. L'unico file contiene `len(7)` e `len(0)`, che danno `TypeError`; non produce output.
- **Lettura:** 0/30. Assente.

### midjaiti_elif — 7/110

- **Teoria:** Q1 3/7, Q2 2/8, Q3 2/5 → 7/20.
- **Codice:** 0/60. E1 è vuoto; E2 contiene una formula, non un programma; E3 non è codice Python valido.
- **Lettura:** 0/30. File vuoti.
- **Note:** I file `domanda2`, `domanda3` e `domanda4` sono stati interpretati come risposte a Q1, Q2 e Q3. Q1 è solo un elenco senza scopi e include "software". Q2 e Q3 sono molto incomplete.

### milena fondriest(1) — 11/110

- **Teoria:** Q1 6/7, Q2 0/8, Q3 0/5 → 6/20.
- **Codice:** E1 5/10, E2 0/20, E3 0/30 → 5/60.
- **Lettura:** 0/30. Assente.
- **Note:** Q1 è sufficiente (cinque componenti con scopi brevi). Q2 e Q3 mancano. E1 conta i pari, ma stampa dentro il ciclo i valori cumulativi `1, 2, 3, 4` invece del solo risultato finale `4`. E2 non somma e, con `i = i + i`, va in ciclo infinito.

### pellegrini-benedetta — 3,5/110

- **Teoria:** Q1 2,5/7, Q2 1/8, Q3 0/5 → 3,5/20.
- **Codice:** 0/60. I file contengono solo `n=7` e `n=10`, senza algoritmo.
- **Lettura:** 0/30. File vuoti.
- **Note:** Q1 elenca quattro componenti con scopi quasi assenti. Q2 parla di variabili e memoria, non di rappresentazione binaria. Q3 manca.

### Rosati-Martino — 9,5/110

- **Teoria:** Q1 5/7, Q2 2/8, Q3 2,5/5 → 9,5/20.
- **Codice:** 0/60. E1 ha un `SyntaxError`; E2 è vuoto; E3 manca.
- **Lettura:** 0/30. Assente.
- **Note:** Q1 elenca cinque componenti, con scopi in parte imprecisi. Q2 si limita a byte e binario, senza caratteri/parole. Q3 dà una definizione parziale di istruzione e sbaglia l'instruction set.

### Valentinelli-Aurora — 47,5/110

- **Teoria:** Q1 2,5/7, Q2 5/8, Q3 0/5 → 7,5/20.
- **Codice:** E1 10/10, E2 12/20, E3 0/30 → 22/60.
- **Lettura:** L1 2/10, L2 8/10, L3 8/10 → 18/30.
- **Note:** Q1 è solo un elenco di nomi senza scopi. Q2 è buona: binario, combinazioni e distinzione numeri/caratteri. Q3 manca. E1 è corretto e generale. E2 esclude `n` dal ciclo (`i < n`), quindi per `n = 10` stampa `45` invece di `55`. E3 non funziona: il ciclo non incrementa `a` e va in ciclo infinito. L1 riporta solo `9`, quindi l'output è incompleto. L2 e L3 riportano output e scopo corretti, ma senza spiegazione dettagliata dei passaggi.
