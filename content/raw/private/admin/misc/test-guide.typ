= Struttura di una prova

Questa guida descrive la cartella di una prova e il ruolo di ogni file.
La fonte di verità è sempre la cartella `testo/` e i sorgenti in `soluzione/`.

== Struttura

```text
content/raw/private/admin/<classe>/<gruppo>/<prova>/
├── testo/
│   ├── <prova>.json          # descrittore della prova
│   ├── <prova>.typ           # documento per un singolo set
│   ├── <prova>-<set>.typ     # documento per ogni set, se i set sono più di uno
│   └── parts/
│       ├── preamble.typ      # istruzioni comuni
│       ├── section-<ID>.typ  # introduzione della categoria
│       └── <EX_ID>.typ       # testo del singolo esercizio
├── soluzione/
│   ├── <EX_ID>.py            # soluzione Python
│   └── <EX_ID>.txt           # soluzione testuale
├── manifest.json             # percorso della prova e default delle correzioni
├── correzioni/
│   └── <studente>.json       # punteggi e commenti dello studente
├── risposte/
│   └── <studente>/
│       ├── esercizio1.py
│       └── snippet1.txt
├── misc/                     # materiale accessorio
└── deploy.toml               # regole locali di pubblicazione
```

== Prove condivise

Una prova può essere condivisa fra più classi. In quel caso il testo e le
soluzioni stanno in `<track>/shared/<prova>/`, mentre ogni classe conserva la
propria cartella con correzioni, risposte e statistiche:

```text
content/raw/private/admin/<track>/shared/<prova>/
├── testo/
└── soluzione/

content/raw/private/admin/<track>/<classe>/<prova>/
├── manifest.json            # test-json punta alla prova condivisa
├── correzioni/
├── risposte/
└── misc/
    └── stats.typ
```

Il `manifest.json` della classe contiene il percorso della prova condivisa, ad
esempio `"test-json": "../../shared/<prova>/testo/<prova>.json"`.

== File principali

#table(
  columns: (auto, 1fr),
  [*Percorso*], [*Uso*],
  [`testo/<prova>.json`], [Descrittore unico della prova: set, categorie, esercizi, punti, durata.],
  [`testo/<prova>.typ`], [Documento Typst che chiama `render-exam` per un set.],
  [`testo/parts/*.typ`], [Frammenti importati dal descrittore o dal documento: non vanno pubblicati da soli.],
  [`soluzione/<EX_ID>.<ext>`], [Sorgente della soluzione di ogni esercizio, uno per ID.],
  [`manifest.json`], [Percorso della prova, cartella delle risposte e default delle correzioni.],
  [`correzioni/<studente>.json`], [Punteggi e commenti dello studente; i dati comuni vengono dal manifest.],
  [`risposte/<studente>/`], [File consegnati dallo studente, con i nomi indicati da `answer-file`.],
  [`deploy.toml`], [Override locali, ad esempio per ignorare `testo/parts/`.],
)

== Descrittore della prova

Il descrittore è il file `testo/<prova>.json`. I campi principali sono:

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
wm exam generate-solutions <exam-dir> --out <out-dir>
```

L'output è:

```text
<out-dir>/<set>/<answer-file>
```

Esempio: `esercizio{ordinal}.py` diventa `a/esercizio1.py`, `b/esercizio1.py`, e così via.
Il comando legge `manifest.json`, il descrittore indicato da `test-json` e la
cartella `soluzione/` della prova. Per una prova condivisa il manifest della
classe punta direttamente a `shared/<prova>/testo/<prova>.json`, quindi
`soluzione/` viene presa dalla prova condivisa.
Se manca anche una sola soluzione, termina con errore senza scrivere nulla.

== Manifest della prova

Ogni cartella di classe contiene un `manifest.json` accanto a `testo/`,
`correzioni/` e `risposte/`:

```json
{
  "$schema": "../../../misc/manifest.schema.json",
  "version": 1,
  "test-json": "../../shared/<prova>/testo/<prova>.json",
  "answer-folder": "risposte",
  "date": "20 ottobre 2026",
  "title": "Correzione — Simulazione 1"
}
```

`test-json` e `answer-folder` sono relativi al manifest. `date` è il default
per le correzioni; `title`, `subtitle` e `import-answers` sono facoltativi e
possono essere sovrascritti da una singola correzione.

== Correzioni

Ogni studente della classe ha un file `correzioni/<studente>.json`.
Nome visualizzato e classe vengono ricavati dal nome del file, dal percorso e
da `content/students.json`. I campi principali sono:

#table(
  columns: (auto, 1fr),
  [*Campo*], [*Significato*],
  [`set`], [Set svolto dallo studente.],
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

Ogni studente della classe deve avere un file, anche quando è assente: le
statistiche usano il roster per elencare tutti gli studenti.

Per pubblicare le risposte e lo stub della correzione nelle cartelle private
degli studenti:

```sh
wm exam deploy <exam-dir> --force
```

Lo stub `correzione.typ` punta direttamente al descrittore in
`admin/.../correzioni/`; non viene più copiato `correzione.json`. Senza
`--force` i file di risposta già presenti non vengono sovrascritti.

== Statistiche

Le statistiche di classe stanno in `misc/stats.typ` e ricevono solo la cartella
delle correzioni:

```typst
#import "/typst-components/src/lib.typ": render-stats

#render-stats(path("../correzioni"))
```

Il componente legge `manifest.json`, il roster della classe e tutti i file in
`correzioni/`. Ogni set ha una sezione separata e le statistiche sono calcolate
solo sugli studenti di quel set.

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
  [`test-folder`], [Cartella della prova, relativa al file del grafo; per `misc/grafo-copie.json` è `".."`.],
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
- Gli ID in `exercises` devono esistere nel descrittore e avere una risposta in tutte le correzioni collegate.

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

Esempio di `deploy.toml` locale:

```toml
[[typst.override]]
glob = "testo/parts/*.typ"
action = "ignore"

[[typst.override]]
glob = "testo/parts/**/*.typ"
action = "ignore"
```

== Checklist

- [ ] `manifest.json` esiste e `test-json` / `answer-folder` risolvono.
- [ ] `sets` nel descrittore corrisponde ai documenti `<prova>-<set>.typ`.
- [ ] Ogni esercizio ha `id`, `file`, `title`, `points` e `difficulty`.
- [ ] Ogni esercizio ha un file `soluzione/<EX_ID>.<ext>`.
- [ ] L'estensione della soluzione coincide con `answer-file`.
- [ ] Ogni studente della classe ha `correzioni/<studente>.json`; gli assenti hanno `{"absent": true}`.
- [ ] `misc/stats.typ` contiene solo `#render-stats(path("../correzioni"))`.
- [ ] `wm exam generate-solutions` termina senza errori.
- [ ] `wm exam stats` termina senza errori.
- [ ] `bun run content:build` termina senza errori.
