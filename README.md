# Materiale

Sito unico per il materiale didattico di **Marini didattica**: ospita i file
statici e li espone con un browser navigabile, diviso in una parte pubblica e
una parte riservata.

Il sito è deployato come GitHub Pages project site:

```text
https://marini-didattica.github.io/materiale/
```

## Struttura

```text
content/
├── raw/
│   ├── public/       # materiale pubblico
│   └── private/      # materiale riservato, una cartella per studente
├── sources/          # sorgenti Typst non pubblicati (es. simulazione-1)
├── students.json     # cartella privata -> codice e dati dello studente
├── typst-theme/      # submodule
└── typst-components/ # submodule
scripts/
└── build-content.ts  # validazione, staging e compilazione Typst
static/
├── favicon.*         # file statici del sito
├── robots.txt
└── raw/              # generato da content:build, non committare
src/
├── components/       # componenti Astro condivisi, incluso Explorer
├── layouts/
├── lib/              # indice del contenuto e dati studenti
├── pages/            # landing, browser pubblico e riservato, 404
└── utils/
```

## URL

I file statici vivono sotto `/raw`; il browser usa lo stesso percorso senza
`/raw`. Per il materiale riservato la cartella dello studente viene sostituita
dal suo codice di accesso.

```text
Pubblico
  content/raw/public/prime/esercitazione-1.typ
    -> /materiale/raw/public/prime/esercitazione-1.pdf
    -> /materiale/public/prime/                        (browser)

Riservato
  content/raw/private/1d/angeli-lorenzo/simulazione-1/correzione.typ
    -> /materiale/raw/private/ABCD2345/simulazione-1/correzione.pdf
    -> /materiale/private/ABCD2345/simulazione-1/      (browser)
    -> /materiale/private/ABCD2345/                    (pagina di benvenuto)
```

La pagina di accesso con il codice resta nel sito principale:
[Area riservata](https://marini-didattica.github.io/area-riservata/). Il modulo
apre `/materiale/private/<codice>/`.

### Amministrazione

`/materiale/admin/` è un browser riservato al docente che unisce materiale
pubblico e privato. Mostra la struttura reale delle cartelle (classe e
studente) senza chiedere alcun codice:

```text
/materiale/admin/
/materiale/admin/public/          (albero pubblico)
/materiale/admin/private/         (classi)
/materiale/admin/private/1d/      (studenti)
/materiale/admin/private/1d/angeli-lorenzo/
```

La pagina non è autenticata e usa `noindex, nofollow`: è solo un comodo
pannello di esplorazione, non una protezione aggiuntiva.

## Sviluppo

```sh
bun install
bun run dev      # http://localhost:4321/materiale/
bun run build    # genera dist/
bun run preview  # anteprima della build
```

Per compilare i documenti Typst serve il comando `typst` nel `PATH`
([installazione](https://github.com/typst/typst#installation)); la CI usa la
versione `0.15.1`.

## Materiale e codici

`content/students.json` descrive ogni area riservata: la chiave è la cartella
sotto `content/raw/private/`, mentre il valore contiene i dati dello studente e
il codice di accesso.

```json
{
  "nome-cognome": {
    "slug": "ABCD2345",
    "owner-first-names": ["Billy"],
    "owner-last-names": ["Jane"],
    "owner-slug": "billy-jane"
  }
}
```

- `slug` è il codice di accesso usato nell'URL del browser.
- `owner-first-names` e `owner-last-names` sono array: un elemento per ogni
  nome o cognome, senza spazi.
- `owner-slug` è opzionale: è la versione abbreviata mostrata nel breadcrumb.

I codici sono 8 caratteri tra `A-Z` e `2-9`, senza `I`, `O`, `0` e `1`. Devono
restare stabili: cambiarli invalida i link già distribuiti.

Il comando `bun run content:build` valida `students.json`, controlla che ogni
file sotto `content/raw/private/` appartenga a una cartella elencata e copia i
file pubblicabili in `static/raw/`. La build di Astro genera poi una pagina per
ogni cartella:

```text
/materiale/public/                                   (elenco pubblico)
/materiale/public/prime/                             (elenco cartella)
/materiale/raw/public/prime/esercitazione-1.pdf
/materiale/private/ABCD2345/                        (benvenuto)
/materiale/private/ABCD2345/simulazione-1/
/materiale/raw/private/ABCD2345/simulazione-1/correzione.pdf
```

Le estensioni servibili sono elencate in `scripts/build-content.ts`. I sorgenti
`.tex`, i file temporanei di LaTeX e i file che possono essere eseguiti nel
browser (`.html`, `.js`) non vengono pubblicati.

### Documenti Typst

Ogni file `.typ` nelle cartelle pubblicate viene compilato in un PDF con lo
stesso nome e nella stessa posizione:

```text
content/raw/private/1d/angeli-lorenzo/simulazione-1/correzione.typ
  -> static/raw/private/ABCD2345/simulazione-1/correzione.pdf
```

Se un PDF con lo stesso nome esiste già nel repository, la versione compilata lo
sostituisce. I sorgenti `.typ` compilati non vengono pubblicati.

Per pubblicare un sorgente `.typ` senza compilarlo, anteponi `_` al nome:
`_esempio.typ` diventa `esempio.typ` nel sito. Il prefisso viene rimosso solo
nell'output, quindi nel repository il file mantiene il nome originale.

La compilazione usa `content/` come root Typst, così i documenti possono
importare `typst-theme` e `typst-components` con percorsi relativi.

Ogni pagina di cartella include un pulsante **Scarica tutto**; ogni riga di
cartella o file ha inoltre un'icona di download a destra. Il download viene
creato nel browser: la pagina scarica i file della cartella selezionata e li
comprime in un archivio ZIP al momento del click.

## Deploy

Ogni push su `main` avvia `.github/workflows/deploy.yml`, che:

1. installa le dipendenze con Bun;
2. installa Typst;
3. esegue `bun run build` (validazione, staging, compilazione Typst, build Astro);
4. pubblica `dist/` su GitHub Pages.

Il sito è raggiungibile su
[marini-didattica.github.io/materiale](https://marini-didattica.github.io/materiale/).

## Submodule

Le cartelle `content/typst-theme/` e `content/typst-components/` sono submodule
Git dei pacchetti Typst condivisi. Dopo il clone:

```sh
git submodule update --init --recursive
# per allinearli all'ultima main:
git submodule update --remote --merge
```

## Privacy

La parte riservata non è autenticata: i codici sono difficili da indovinare, ma
il repository è pubblico e i file sono raggiungibili da chi conosce l'URL. È lo
stesso modello del precedente repository `riservato`.
