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
├── correzioni/
│   └── <studente>.json       # descrittore della correzione
├── risposte/
│   └── <studente>/
│       ├── esercizio1.py
│       └── snippet1.txt
├── misc/                     # materiale accessorio
└── deploy.toml               # regole locali di pubblicazione
```

== File principali

#table(
  columns: (auto, 1fr),
  [*Percorso*], [*Uso*],
  [`testo/<prova>.json`], [Descrittore unico della prova: set, categorie, esercizi, punti, durata.],
  [`testo/<prova>.typ`], [Documento Typst che chiama `render-exam` per un set.],
  [`testo/parts/*.typ`], [Frammenti importati dal descrittore o dal documento: non vanno pubblicati da soli.],
  [`soluzione/<EX_ID>.<ext>`], [Sorgente della soluzione di ogni esercizio, uno per ID.],
  [`correzioni/<studente>.json`], [Punteggi, commenti e collegamento alle risposte dello studente.],
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
Il comando legge `<exam-dir>/testo/*.json` e `<exam-dir>/soluzione/`.
Se manca anche una sola soluzione, termina con errore senza scrivere nulla.

== Correzioni

Ogni studente ha un file `correzioni/<studente>.json`.
I campi principali sono:

#table(
  columns: (auto, 1fr),
  [*Campo*], [*Significato*],
  [`test-json`], [Percorso del descrittore della prova.],
  [`answer-folder`], [Cartella con le risposte dello studente.],
  [`set`], [Set svolto dallo studente.],
  [`student-name`], [Nome completo, facoltativo.],
  [`class`], [Classe, facoltativa.],
  [`import-answers`], [Se `true`, importa il contenuto delle risposte nella correzione.],
  [`exercises`], [Mappa `ID -> { "answer-file", "score", "comment" }`.],
)

Esempio minimo:

```json
{
  "answer-folder": "../risposte/mario-rossi",
  "test-json": "../testo/prova-1.json",
  "set": "a",
  "import-answers": true,
  "exercises": {
    "E1": {
      "answer-file": "esercizio1.py",
      "score": 12,
      "comment": "Soluzione corretta."
    }
  }
}
```

Per pubblicare correzioni e risposte nelle cartelle private degli studenti:

```sh
wm exam deploy <exam-dir> --force
```

Senza `--force` i file già presenti non vengono sovrascritti.

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

- [ ] `sets` nel descrittore corrisponde ai documenti `<prova>-<set>.typ`.
- [ ] Ogni esercizio ha `id`, `file`, `title`, `points` e `difficulty`.
- [ ] Ogni esercizio ha un file `soluzione/<EX_ID>.<ext>`.
- [ ] L'estensione della soluzione coincide con `answer-file`.
- [ ] Ogni studente ha `correzioni/<studente>.json` e `risposte/<studente>/`.
- [ ] `wm exam generate-solutions` termina senza errori.
- [ ] `bun run content:build` termina senza errori.
