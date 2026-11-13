= Struttura di una prova

Questa guida descrive le cartelle di una prova e il ruolo di ogni file.
Le prove sono raccolte in `admin/tests/`; le correzioni e le risposte stanno
in `admin/corrections/`, una cartella per classe e prova.

== Struttura

```text
content/raw/private/admin/
├── tests/
│   └── <prova>/
│       ├── testo/
│       │   ├── <prova>.json          # descrittore della prova
│       │   ├── <prova>.typ           # documento per un singolo set
│       │   ├── <prova>-<set>.typ     # documento per ogni set, se i set sono più di uno
│       │   └── parts/
│       │       ├── preamble.typ      # istruzioni comuni
│       │       ├── section-<ID>.typ  # introduzione della categoria
│       │       └── <EX_ID>.typ       # testo del singolo esercizio
│       ├── soluzione/
│       │   ├── <EX_ID>.py            # soluzione Python
│       │   └── <EX_ID>.txt           # soluzione testuale
│       ├── misc/                     # materiale accessorio della prova
│       └── deploy.toml               # regole locali di pubblicazione
└── corrections/
    └── <classe>/
        └── <prova>/
            ├── manifest.json         # prova, data e default delle correzioni
            ├── correzioni/
            │   └── <studente>.json   # punteggi e commenti dello studente
            ├── risposte/
            │   └── <studente>/
            │       ├── esercizio1.py
            │       └── snippet1.txt
            └── misc/                 # statistiche e materiale della classe
```

Il nome `<prova>` è univoco in `admin/tests/`. Per le prove che cambiano da
classe a classe si usa un nome che le distingue, ad esempio `prova-1-1c` e
`prova-1-1d`. Un nome come `prova-1` può essere usato da più classi solo se la
prova è davvero la stessa.

== Prove condivise e sostituzioni

Una prova condivisa esiste una sola volta in `admin/tests/` e viene indicata da
più manifest. Non esiste più una cartella `shared/`: la condivisione è solo un
nome usato da più classi.

```text
admin/tests/esercitazione-1-prime/      # testo e soluzioni, una sola copia
admin/corrections/1c/esercitazione-1/   # manifest: test = "esercitazione-1-prime"
admin/corrections/1d/esercitazione-1/   # manifest: test = "esercitazione-1-prime"
```

Una prova è indirizzata dal suo nome, non dal percorso della classe. Questo
permette di far svolgere a uno studente la prova di un'altra sezione senza
duplicare testo o soluzioni: basta aggiungere `test` al singolo file di
correzione.

== File principali

#table(
  columns: (auto, 1fr),
  [*Percorso*], [*Uso*],
  [`tests/<prova>/testo/<prova>.json`], [Descrittore unico della prova: set, categorie, esercizi, punti, durata.],
  [`tests/<prova>/testo/<prova>.typ`], [Documento Typst che chiama `render-exam` per un set.],
  [`tests/<prova>/testo/parts/*.typ`], [Frammenti importati dal descrittore o dal documento: non vanno pubblicati da soli.],
  [`tests/<prova>/soluzione/<EX_ID>.<ext>`], [Sorgente della soluzione di ogni esercizio, uno per ID.],
  [`corrections/<classe>/<prova>/manifest.json`], [Nome della prova, data e default delle correzioni.],
  [`corrections/<classe>/<prova>/correzioni/<studente>.json`], [Punteggi e commenti dello studente; i dati comuni vengono dal manifest.],
  [`corrections/<classe>/<prova>/risposte/<studente>/`], [File consegnati dallo studente, con i nomi indicati da `answer-file`.],
  [`corrections/<classe>/<prova>/deploy.toml`], [Override locali della cartella della classe, se servono.],
)

== Descrittore della prova

Il descrittore è il file `tests/<prova>/testo/<prova>.json`. I campi principali sono:

#table(
  columns: (auto, 1fr),
  [*Campo*], [*Significato*],
  [`version`], [Versione dello schema; attualmente `1`.],
  [`sets`], [Nomi dei set, ad esempio `["default"]`, `["a", "b"]`, `["default", "bes"]`.],
  [`preamble-file`], [Percorso del preambolo, relativo a `testo/`.],
  [`metadata`], [Classe, titolo, sottotitolo, durata e autore.],
  [`categories`], [Elenco delle categorie; ogni categoria contiene gli esercizi.],
  [`exercises`], [Elenco degli esercizi di una categoria.],
)

Ogni esercizio usa questi campi:

#table(
  columns: (auto, 1fr),
  [*Campo*], [*Significato*],
  [`id`], [Identificativo stabile, ad esempio `E1` o `S3`; determina il nome del file in `soluzione/`.],
  [`file`], [Percorso del testo `.typ`, relativo a `testo/`.],
  [`answer-file`], [Nome del file di risposta, anche con segnaposto.],
  [`sets`], [Set in cui compare l'esercizio; se manca eredita dalla categoria e poi dalla prova.],
  [`title`], [Titolo mostrato nella prova.],
  [`points`], [Punteggio, numero oppure oggetto per set.],
  [`difficulty`], [Difficoltà da 1 a 5, numero oppure oggetto per set.],
)

`answer-file` supporta questi segnaposto:

- `{ordinal}`: posizione dell'esercizio nella categoria per il set corrente.
- `{id}`: ID dell'esercizio, ad esempio `E4`.
- `{category}`: ID della categoria, ad esempio `E`.
- `{tag}`: etichetta della categoria in minuscolo, ad esempio `esercizio`.
- `{set}`: nome del set corrente, ad esempio `b`.

Attenzione: `{ordinal}` si riferisce alla posizione nel set, non all'ID.
Se un esercizio è presente solo in alcuni set, la numerazione può cambiare.

== Soluzioni

Regola: in `soluzione/` c'è esattamente un file per esercizio, chiamato `<EX_ID>.<ext>`.

- L'estensione deve coincidere con quella di `answer-file`: `.py` per gli esercizi di codice, `.txt` per domande e snippet.
- Il contenuto è la soluzione sorgente; il nome studente non compare mai.
- I file generati non vanno salvati in `soluzione/`: sono output usa e getta.

Per generare le cartelle per set:

```sh
wm exam generate-solutions <prova-o-cartella-classe> --out <out-dir>
```

L'output è:

```text
<out-dir>/<set>/<answer-file>
```

Esempio: `esercizio{ordinal}.py` diventa `a/esercizio1.py`, `b/esercizio1.py`, e così via.
Il comando accetta sia la cartella della prova (`admin/tests/<prova>`) sia la
cartella della classe (`admin/corrections/<classe>/<prova>`); in quest'ultimo
caso legge `manifest.json` e ricava la prova. Se manca anche una sola soluzione,
termina con errore senza scrivere nulla.

== Manifest della prova

Ogni cartella di classe contiene un `manifest.json` accanto a `correzioni/` e
`risposte/`:

```json
{
  "$schema": "../../../misc/manifest.schema.json",
  "version": 1,
  "test": "prova-1-1c",
  "date": "12 novembre 2026",
  "title": "Correzione — Simulazione 1"
}
```

`test` è il nome della prova in `admin/tests/`; il descrittore viene cercato in
`<tests-root>/<test>/testo/<test>.json`. `tests-root` è facoltativo e vale
`../../../tests` per una cartella `admin/corrections/<classe>/<prova>/`; si può
indicare un percorso diverso se la struttura cambia. `answer-folder` è
facoltativo e vale `risposte`. `date` è il default per le correzioni; `title`,
`subtitle` e `import-answers` sono facoltativi e possono essere sovrascritti da
una singola correzione.

Per compatibilità resta accettato anche il vecchio campo `test-json` con un
percorso esplicito, ma i nuovi manifest devono usare `test`.

== Correzioni

Ogni studente della classe ha un file `correzioni/<studente>.json`.
Nome visualizzato e classe vengono ricavati dal nome del file, dal percorso e
da `content/students.json`. I campi principali sono:

#table(
  columns: (auto, 1fr),
  [*Campo*], [*Significato*],
  [`set`], [Set svolto dallo studente.],
  [`test`], [Prova diversa da quella del manifest, se lo studente ha svolto quella di un'altra sezione.],
  [`date`], [Data, solo se diversa dal manifest.],
  [`title`], [Titolo, solo se diverso dal manifest o dal descrittore della prova.],
  [`subtitle`], [Sottotitolo, facoltativo.],
  [`import-answers`], [Se `true`, importa il contenuto delle risposte nella correzione.],
  [`exercises`], [Mappa `ID -> { "answer-file", "score", "comment" }`.],
)

Esempio minimo:

```json
{
  "set": "a",
  "exercises": {
    "E1": {
      "answer-file": "esercizio1.py",
      "score": 12,
      "comment": "Soluzione corretta."
    }
  }
}
```

Uno studente assente ha solo:

```json
{ "absent": true }
```

Uno studente che ha svolto la prova di un'altra sezione aggiunge `test`:

```json
{
  "test": "prova-1-1d",
  "set": "default",
  "exercises": {
    "D1": { "answer-file": "domanda1.txt", "score": 7, "comment": "Corretta." }
  }
}
```

In questo caso `set` e gli ID degli esercizi sono quelli della prova indicata da
`test`, non quelli del manifest. Anche punteggio massimo, soglia della lode e
conversione in voto vengono dalla prova effettiva.

Ogni studente della classe deve avere un file, anche quando è assente: le
statistiche usano il roster per elencare tutti gli studenti.

Per pubblicare le risposte e lo stub della correzione nelle cartelle private
degli studenti:

```sh
wm exam deploy <corrections/classe/prova> --force
```

Lo stub `correzione.typ` punta direttamente al descrittore in
`admin/corrections/.../correzioni/`; non viene più copiato `correzione.json`.
Senza `--force` i file di risposta già presenti non vengono sovrascritti.

== Statistiche

Le statistiche di classe stanno in `corrections/<classe>/<prova>/misc/stats.typ`
e ricevono solo la cartella delle correzioni:

```typst
#import "/typst-components/src/lib.typ": render-stats

#render-stats(path("../correzioni"))
```

Il componente legge `manifest.json`, il roster della classe e tutti i file in
`correzioni/`. Ogni set ha una sezione separata e le statistiche sono calcolate
solo sugli studenti di quel set. Se uno o più studenti hanno svolto una prova
diversa tramite `test`, ogni prova ha una sezione separata: non vengono mai
confrontate risposte di prove diverse.

Da terminale:

```sh
wm exam stats <correzioni-folder>
```

L'output predefinito è `misc/stats.pdf` della cartella della classe; il comando
accetta anche `--out`.

== Grafo delle copie

File facoltativo: `misc/grafo-copie.json`.
Serve al visualizzatore del checker per mostrare le coppie di risposte sospette.

Campi principali:

#table(
  columns: (auto, 1fr),
  [*Campo*], [*Uso*],
  [`name`], [Titolo mostrato dal visualizzatore.],
  [`test-folder`], [Cartella della classe, relativa al file del grafo; per `misc/grafo-copie.json` è `".."`.],
  [`elements.nodes`], [Un nodo per studente che ha svolto la prova.],
  [`elements.edges`], [Un arco per ogni coppia di risposte sospette.],
)

Nodo:

- `data.id`: slug dello studente, uguale al nome di `correzioni/<studente>.json` e `risposte/<studente>/`.
- `data.seat`: posto a sedere, ad esempio `"fila 1, banco 1"`, ricavato da `misc/dislocazione.typ`.
- `data.confidence`: numero facoltativo da `0` a `1`; disegna un contorno tanto più spesso quanto è alto il valore.
- `data.exercise-notes`: oggetto facoltativo `ID esercizio -> testo`; cliccando il nodo si apre la nota accanto alla risposta dello studente.
- `style.label`: nome mostrato, ad esempio `"Cognome\nNome"`.

Arco:

- `data.id`: identificativo unico dell'arco.
- `data.source` e `data.target`: ID dei due studenti.
- `data.confidence`: numero da `0` a `1`; più è alto, più la coppia è sospetta.
- `data.exercises`: ID degli esercizi con risposte troppo simili.

Esempio minimo:

```json
{
  "name": "2C · Prova 1 · copie sospette",
  "test-folder": "..",
  "elements": {
    "nodes": [
      {
        "data": { "id": "bonetti-alessandra", "seat": "fila 1, banco 2" },
        "style": { "label": "Bonetti\nAlessandra" }
      },
      {
        "data": { "id": "lorenzi-diego", "seat": "fila 2, banco 1" },
        "style": { "label": "Lorenzi\nDiego" }
      }
    ],
    "edges": [
      {
        "data": {
          "id": "bonetti-alessandra--lorenzi-diego--e4",
          "source": "bonetti-alessandra",
          "target": "lorenzi-diego",
          "confidence": 0.5,
          "exercises": ["E4"]
        }
      }
    ]
  }
}
```

Regole:

- Ogni studente presente ha un nodo; gli studenti assenti possono mancare.
- Creare archi solo per coppie con risposte anomale: nessun arco significa nessun sospetto.
- `confidence` misura la somiglianza delle risposte, non la distanza fisica.
- La vicinanza di banco aumenta la probabilità di copiatura: usarla per valutare i casi limite.
- Gli ID in `exercises` devono esistere nel descrittore della prova effettiva e avere una risposta in tutte le correzioni collegate.

== Documenti Typst

Un documento per set contiene solo il caricamento del descrittore:

```typst
#import "/typst-components/src/lib.typ": render-exam

#render-exam(path("<prova>.json"), "<set>")
```

- Un solo set: usare `<prova>.typ`.
- Più set: usare un file `<prova>-<set>.typ` per ogni set.
- `parts/section-<ID>.typ` contiene l'introduzione della categoria.
- `parts/<EX_ID>.typ` contiene il testo del singolo esercizio.
- `testo/parts/*.typ` va escluso dalla pubblicazione con `deploy.toml`.

Esempio di `deploy.toml` locale nella cartella della prova:

```toml
[[typst.override]]
glob = "testo/parts/*.typ"
action = "ignore"

[[typst.override]]
glob = "testo/parts/**/*.typ"
action = "ignore"
```

== Checklist

- [ ] Il nome della prova è univoco in `admin/tests/`.
- [ ] `tests/<prova>/testo/<prova>.json` e `tests/<prova>/testo/<prova>.typ` (o `<prova>-<set>.typ`) esistono.
- [ ] `corrections/<classe>/<prova>/manifest.json` esiste e `test` / `answer-folder` risolvono.
- [ ] `sets` nel descrittore corrisponde ai documenti `<prova>-<set>.typ`.
- [ ] Ogni esercizio ha `id`, `file`, `title`, `points` e `difficulty`.
- [ ] Ogni esercizio ha un file `soluzione/<EX_ID>.<ext>`.
- [ ] L'estensione della soluzione coincide con `answer-file`.
- [ ] Ogni studente della classe ha `correzioni/<studente>.json`; gli assenti hanno `{"absent": true}`.
- [ ] Se uno studente ha svolto la prova di un'altra sezione, la correzione ha `test` e gli ID di quella prova.
- [ ] `misc/stats.typ` contiene solo `#render-stats(path("../correzioni"))`.
- [ ] `wm exam generate-solutions` termina senza errori.
- [ ] `wm exam stats` termina senza errori.
- [ ] `bun run content:build` termina senza errori.
