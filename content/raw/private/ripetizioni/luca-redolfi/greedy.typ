// Compile from the materiale repository root:
// typst compile --root content content/raw/private/ripetizioni/luca-redolfi/greedy.typ
#import "../../../../typst-theme/src/lib.typ": palette, spazio, theme
#import "../../../../typst-components/src/lib.typ": (
  callout, checklist, cover, esempi, nota,
)

#set document(title: "Algoritmi golosi — Ripetizioni", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Algoritmi golosi · Ripetizioni")

// Intestazione dei problemi: come `testata`, ma senza il punteggio.
#let problema(numero, titolo, corpo) = block(
  above: spazio.xl,
  width: 100%,
  breakable: false,
)[
  #block(
    width: 100%,
    fill: palette.tint,
    radius: (top-right: 3pt, bottom-right: 3pt),
    inset: spazio.page.sm,
    outset: (left: -1.3pt),
    stroke: (left: 2.6pt + palette.accent),
  )[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 8pt,
      align: horizon,
      box(
        fill: palette.accent,
        inset: (x: 6pt, y: 2.5pt),
        radius: 3pt,
      )[#text(fill: white, size: 0.78em, weight: 700)[Problema #numero]],
      text(weight: 700, size: 12pt, fill: palette.ink)[#titolo],
    )
  ]
  #v(spazio.page.md)
  #corpo
]

#cover(
  top: "RIPETIZIONI · LUCA REDOLFI · INFORMATICA",
  title: "Algoritmi golosi",
  subtitle: "Scegliere bene un passo alla volta",
  decoration: auto,
  descriptors: (
    ("Tema", "Greedy"),
    ("Esercizi", "3"),
    ("Livello", "Introduttivo"),
  ),
  student-data: none,
  body: [
    #callout("Come usare questa dispensa")[
      - La prima parte è una breve introduzione: bastano pochi minuti.
      - Prova ogni problema da solo, poi confronta il tuo ragionamento con le soluzioni in fondo.
      - Non basta far funzionare un esempio: cerca sempre un controesempio.
    ]
  ],
)

#pagebreak()

= Che cos'è un algoritmo goloso?

Un algoritmo *goloso* (dall'inglese *greedy*) costruisce la soluzione un pezzo alla volta. A ogni
passo guarda le alternative disponibili, sceglie quella che sembra *migliore in quel momento* e non
torna più indietro. Non prova tutte le combinazioni: prende una decisione locale e la mantiene fino
alla fine.

#callout("L'idea in una frase")[
  Una scelta localmente ottima, ripetuta fino alla fine, produce una soluzione globalmente ottima.
]

Il punto delicato è quel *se*: non sempre una catena di scelte locali porta all'ottimo globale. Il
greedy funziona quando valgono due proprietà:

+ *scelta golosa sicura*: esiste una soluzione ottima che comincia con la scelta fatta dal greedy;
+ *sottostruttura ottima*: dopo aver fissato quella scelta, il problema che resta è dello stesso tipo.

In pratica si sceglie un criterio di ordinamento, si ordinano gli elementi, si scorrono e si accetta
ogni elemento compatibile con quelli già scelti. La parte difficile non è il ciclo: è trovare il
criterio giusto e dimostrare che non esistono controesempi.

#nota[
  *Il greedy non è magico.* Con monete da $1$, $3$ e $4$ e un totale da raggiungere di $6$, il greedy
  prende subito la moneta più grande: $4 + 1 + 1$, cioè tre monete. La soluzione ottima è $3 + 3$,
  cioè due monete. La scelta migliore *adesso* non è la scelta migliore *alla fine*.
]

= Esercizi

Per ogni problema: scrivi il criterio goloso, applicalo a mano sull'esempio e chiediti se la scelta
locale porta davvero all'ottimo. Un caso favorevole non è una dimostrazione.

#checklist("Metodo di lavoro", (
  [Definisci le scelte possibili e il criterio di ordinamento.],
  [Applica il criterio all'esempio, passo per passo.],
  [Controlla se il risultato è davvero il migliore possibile.],
  [Cerca un controesempio: se lo trovi, il criterio non è corretto.],
))

#problema(1, [Impila le scatole])[
  Hai una lista di scatole. Ogni scatola è descritta da tre dimensioni $(a, b, c)$. Puoi ruotarla
  come vuoi: scegli quale dimensione usare come *altezza*; le altre due diventano la *base*. Le
  scatole vanno impilate una sull'altra e la base di ogni scatola deve stare completamente dentro la
  base di quella sotto, con i lati paralleli. Ogni scatola può essere usata *al più una volta*.

  Obiettivo: massimizzare l'altezza totale della torre.

  #nota[
    Il criterio più spontaneo è ordinare le scatole per *area di base* decrescente e impilare quelle
    che entrano. Funziona sugli esempi facili, ma non è sempre ottimo: il modo in cui ruoti una
    scatola cambia sia l'altezza sia la base. Prova a cercare un controesempio prima di accettare il
    criterio.
  ]

  #esempi((
    (
      [`(4, 4, 10), (3, 3, 8), (2, 2, 6)`],
      [`24`],
      [Le basi $4 times 4$, $3 times 3$ e $2 times 2$ si incastrano; le altezze sono $10 + 8 + 6 = 24$.],
    ),
    (
      [`(5, 4, 3), (4, 3, 2)`],
      [`9`],
      [La prima scatola va ruotata con altezza $5$ (base $4 times 3$), la seconda con altezza $4$
        (base $3 times 2$): $5 + 4 = 9$.],
    ),
  ))
]

#problema(2, [Zaino frazionario])[
  Hai uno zaino che sopporta al massimo un peso $C$. Hai $n$ oggetti: l'oggetto $i$ ha peso $p_i$ e
  valore $v_i$. A differenza dello zaino *0/1*, puoi prendere anche una *frazione* di un oggetto: se
  ne prendi la frazione $x_i in [0, 1]$, ottieni valore $x_i v_i$ e occupi peso $x_i p_i$.

  Obiettivo: scegliere le frazioni per massimizzare il valore totale senza superare $C$.

  #callout("Domande")[
    + Conviene ordinare per peso crescente, per valore decrescente o per rapporto $v_i / p_i$
      decrescente?
    + Applica il criterio all'esempio e calcola il valore ottenuto.
    + Perché, potendo spezzare gli oggetti, il criterio scelto è davvero ottimo?
  ]

  #esempi((
    (
      [`C = 50` #linebreak() `(p, v): (10, 60), (20, 100), (30, 120)`],
      [`240`],
      [Rapporti $6$, $5$, $4$: prendi i primi due oggetti e $20/30$ del terzo. Valore
        $60 + 100 + 80 = 240$.],
    ),
  ))
]

#problema(3, [Intervalli non pesati])[
  Hai una lista di intervalli $[s_i, f_i]$: rappresentano lezioni, riunioni o attività con inizio
  $s_i$ e fine $f_i$. Vuoi scegliere il *maggior numero possibile* di intervalli che non si
  sovrappongono. Due intervalli scelti $[s_i, f_i]$ e $[s_j, f_j]$ sono compatibili se
  $f_i <= s_j$ oppure $f_j <= s_i$. Tutti gli intervalli valgono uguale: non ci sono pesi.

  Obiettivo: determinare il numero massimo di intervalli compatibili e una scelta che lo raggiunge.

  #callout("Domande")[
    + Tre criteri possibili: inizio più presto, durata più breve, fine più presto. Quale funziona
      sempre?
    + Applica il criterio all'esempio.
    + Trova un esempio in cui uno degli altri due criteri fallisce.
  ]

  #esempi((
    (
      [`[1,4], [3,5], [0,6], [5,7], [3,9], [5,9], [6,10], [8,11]`],
      [`3`],
      [La scelta $[1,4]$, $[5,7]$, $[8,11]$ è compatibile e ha tre intervalli.],
    ),
  ))
]

#pagebreak()

= Soluzioni

#callout("Problema 1 — Impila le scatole")[
  Il greedy per area di base non è affidabile. Controesempio: scatole $(100, 10, 1)$,
  $(20, 20, 100)$ e $(15, 15, 100)$. Un greedy che parte dalla scatola con base più grande e
  costruisce dal basso verso l'alto sceglie per la prima la base $100 times 10$ con altezza $1$; le
  altre due hanno lati $20$ e $15$, quindi non entrano sopra una base con il lato corto pari a $10$.
  La torre si ferma a un'altezza di $1$. La soluzione ottima mette in basso la scatola
  $20 times 20$ (altezza $100$), sopra quella $15 times 15$ (altezza $100$) e in cima la prima
  ruotata con base $10 times 1$ (altezza $100$): totale $300$.

  Anche scegliere sempre l'orientamento più alto non basta: con $(10, 10, 1)$ e $(9, 9, 9)$ si ottiene
  $9$, mentre mettendo la prima con base $10 times 10$ e altezza $1$ sotto la seconda si ottiene
  $10$. Per la soluzione esatta servono tutte le orientazioni e un confronto sistematico, ad esempio
  con la programmazione dinamica.
]

#callout("Problema 2 — Zaino frazionario")[
  Il criterio corretto è il *rapporto valore/peso* decrescente. Nell'esempio i rapporti sono $6$,
  $5$ e $4$: si prendono interamente i primi due oggetti (peso $30$, valore $160$) e poi $20$ unità
  del terzo, cioè $20/30 = 2/3$ del suo valore, $80$. Valore totale $240$.

  Perché è ottimo: se in una soluzione ci fosse un oggetto con rapporto più basso e uno con rapporto
  più alto non ancora preso interamente, converrebbe spostare peso dal primo al secondo. Ripetendo
  questo scambio si arriva alla soluzione golosa, quindi non può esistere una soluzione migliore.
]

#callout("Problema 3 — Intervalli non pesati")[
  Il criterio corretto è *fine più presto*: si ordina per $f_i$ crescente e si prende ogni intervallo
  che inizia dopo la fine dell'ultimo scelto. Nell'esempio si scelgono $[1,4]$, $[5,7]$ e $[8,11]$,
  per un totale di $3$.

  Perché è ottimo: scegliere l'intervallo che finisce prima lascia il massimo spazio possibile per i
  successivi. Se una soluzione ottima sceglie un intervallo che finisce più tardi, lo si può
  sostituire con quello che finisce prima senza perdere compatibilità.

  Gli altri criteri falliscono. Con *inizio più presto*, sugli intervalli $[0,6]$, $[1,4]$ e $[4,8]$
  si sceglie $[0,6]$ e ci si ferma a $1$, mentre $[1,4]$ e $[4,8]$ danno $2$. Con *durata più breve*,
  sugli intervalli $[1,4]$, $[3,5]$ e $[4,8]$ si sceglie $[3,5]$ e ci si ferma a $1$, mentre
  $[1,4]$ e $[4,8]$ danno $2$.
]
