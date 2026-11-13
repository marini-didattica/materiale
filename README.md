# Materiale

Sito unico per il materiale didattico di **Marini didattica**: ospita i file
statici e li espone con un browser navigabile, diviso in una parte pubblica e
una parte riservata.

Il sito è deployato su Cloudflare Pages, in due progetti:

```text
https://materiale.didattica.mattia-marini.com/   # pubblico e studenti
https://admin.didattica.mattia-marini.com/       # docente, login
```

Gli hostname `*.pages.dev` restano disponibili come fallback. I nomi dei
progetti sono configurati nel dashboard Cloudflare e in
`.github/workflows/deploy.yml`; gli URL pubblici sono in `src/consts.ts`.

## Struttura

```text
content/
├── raw/
│   ├── public/       # materiale pubblico
│   └── private/      # materiale riservato, una cartella per studente
├── sources/          # sorgenti Typst non pubblicati (es. simulazione-1)
└── students.json     # cartella privata -> codice e dati dello studente
typst-components/     # submodule: tema, componenti e template
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
    -> /raw/public/prime/esercitazione-1.pdf
    -> /public/prime/                                  (browser)

Riservato
  content/raw/private/1d/angeli-lorenzo/simulazione-1/le-tue-risposte/esercizio1.py
    -> /raw/private/ABCD2345/simulazione-1/le-tue-risposte/esercizio1.py
    -> /private/ABCD2345/simulazione-1/                (browser)
    -> /private/ABCD2345/                              (pagina di benvenuto)
```

Le correzioni non hanno più uno stub `.typ` nella cartella dello studente: il
build genera `correzione.pdf` dalle coorti in
`content/raw/private/admin/corrections/<classe>/<prova>/` che hanno
`"publish": true` nel manifest.

La pagina di accesso con il codice resta nel sito principale:
[Area riservata](https://didattica.mattia-marini.com/area-riservata/). Il
modulo apre `/private/<codice>/` sul progetto `marini-didattica-materiale`.

### Amministrazione

`/admin/` è un browser riservato al docente che unisce materiale pubblico e
privato. Mostra la struttura reale delle cartelle (classe e studente) senza
chiedere alcun codice:

```text
/admin/
/admin/public/          (albero pubblico)
/admin/private/         (classi)
/admin/private/1d/      (studenti)
/admin/private/1d/angeli-lorenzo/
```

Le pagine di amministrazione e i file della cartella staff (`"staff": true` in
`content/students.json`) vengono costruiti in `dist-admin/`, pubblicati solo sul
progetto `marini-didattica-admin` e protetti da una pagina di login Astro
(`/login/`) e da una sessione firmata HttpOnly, gestita da
`deploy/admin/_worker.js`. La build pubblica (`dist-public/`) non contiene né
`/admin`, né i file staff, né il worker, né la pagina di login.

Le credenziali non stanno nel repository: sono le variabili del progetto Pages
`ADMIN_USER` e `ADMIN_PASS` (secret). Se mancano, il worker risponde `503`.
Dopo il login la sessione dura 12 ore; il pulsante **Esci** la cancella. HTTP
Basic resta accettato per script e `curl`.

## Sviluppo

```sh
bun install
bun run dev            # http://localhost:4321/
bun run build          # genera dist/
bun run build:deploy   # genera dist-public/ e dist-admin/
bun run preview        # anteprima della build
```

Per compilare i documenti Typst serve il comando `typst` nel `PATH`
([installazione](https://github.com/typst/typst#installation)); la CI usa la
versione `0.15.1`.

Il font Inter è servito da questo deployment su `/fonts/` (il file è in
`static/fonts/`), quindi il sito non dipende più da quello principale. In
sviluppo `astro.config.mjs` espone una copia di `@fontsource-variable/inter`
sullo stesso percorso come fallback.

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

I codici sono 8 caratteri alfanumerici maiuscoli (`A-Z`, `0-9`). Devono restare
stabili: cambiarli invalida i link già distribuiti.

Il comando `bun run content:build` valida `students.json`, controlla che ogni
file sotto `content/raw/private/` appartenga a una cartella elencata e copia i
file pubblicabili in `static/raw/`. La build di Astro genera poi una pagina per
ogni cartella:

```text
/public/                                   (elenco pubblico)
/public/prime/                             (elenco cartella)
/raw/public/prime/esercitazione-1.pdf
/private/ABCD2345/                        (benvenuto)
/private/ABCD2345/simulazione-1/
/raw/private/ABCD2345/simulazione-1/correzione.pdf
```

Le estensioni servibili sono elencate in `scripts/lib/content-publisher.ts`. I
sorgenti `.tex`, i file temporanei di LaTeX e i file che possono essere eseguiti
nel browser (`.html`, `.js`) non vengono pubblicati.

### Documenti Typst

Ogni file `.typ` nelle cartelle pubblicate viene compilato in un PDF con lo
stesso nome e nella stessa posizione:

```text
content/raw/public/prime/programma.typ
  -> static/raw/public/prime/programma.pdf
```

Se un PDF con lo stesso nome esiste già nel repository, la versione compilata lo
sostituisce. I sorgenti `.typ` compilati non vengono pubblicati. Le correzioni
degli studenti sono l'eccezione: non hanno un sorgente `.typ` nella cartella
privata, vengono generate dal build da
`content/raw/private/admin/corrections/<classe>/<prova>/` quando il manifest ha
`"publish": true`.

Per pubblicare un sorgente `.typ` senza compilarlo, anteponi `_` al nome:
`_esempio.typ` diventa `esempio.typ` nel sito. Il prefisso viene rimosso solo
nell'output, quindi nel repository il file mantiene il nome originale.

La compilazione usa la root del repository come root Typst, così i documenti
possono importare `typst-components` con percorsi assoluti
(`/typst-components/src/lib.typ`).

### Configurazione del deploy

Il comportamento di `content:build` è controllato da `content/deploy.toml`.
Senza quel file valgono i default storici: ogni `.typ` viene compilato, i file
`_nome.typ` vengono pubblicati come `nome.typ` e gli altri file seguono la
lista delle estensioni consentite.

```toml
version = 1

[typst]
# compile | publish | ignore
default_action = "compile"
# default | compile | publish | ignore
underscore_action = "publish"
# per ora è supportato solo "pdf"
format = "pdf"

[ignore]
patterns = [
  "**/*.tex",
  "public/prime/esercitazione-1/soluzione/",
]

[[typst.override]]
glob = "**/domande/_*.typ"
action = "ignore"
```

I pattern di `[ignore]` seguono la sintassi di `.gitignore` e sono relativi a
`content/raw/`:

- `*.tmp` corrisponde a qualsiasi profondità, `public/...` è ancorato alla root;
- `soluzione/` ignora la cartella e tutto il suo contenuto;
- `**` corrisponde a un numero qualsiasi di cartelle;
- `!pattern` riattiva un file, se l'ultima regola che lo riguarda è negativa.
  Per riattivare un file dentro una cartella ignorata, ignora i figli
  (`soluzione/*`) invece della cartella (`soluzione/`), oppure usa un
  `deploy.toml` locale.

Per le regole locali basta mettere un `deploy.toml` nella cartella interessata:
i suoi pattern sono relativi a quella cartella e valgono per tutta la
sottocartella. Il file si sposta insieme al materiale, quindi non serve
aggiornare i percorsi quando una cartella viene rinominata o spostata.

```toml
# content/raw/public/prime/esercitazione-1/deploy.toml
[ignore]
patterns = ["soluzione/"]

[[typst.override]]
glob = "_*.typ"
action = "publish"
```

Un `deploy.toml` locale può contenere solo `[ignore]` e `[[typst.override]]`;
le impostazioni globali di `[typst]` restano in `content/deploy.toml`. Le
regole vengono valutate dalla cartella più esterna a quella più interna:
l'ultima regola che corrisponde vince, quindi una regola locale può sovrascrivere
quella globale (anche riattivando un file). Un override `[[typst.override]]`
esplicito vince sempre sulla convenzione `_`.

Le azioni disponibili per un sorgente `.typ` sono:

- `compile`: compila in `<nome>.<format>` e pubblica il risultato;
- `publish`: pubblica il sorgente `<nome>.typ` senza compilarlo;
- `ignore`: non compila e non pubblica, ma il file resta in `content/` per gli
  import degli altri documenti.

Il prefisso `_` è solo un marcatore del sorgente e viene rimosso dal nome
pubblicato. Un override che non corrisponde a nessun file fa fallire la build;
lo stesso vale se due sorgenti producono lo stesso file. Il file `deploy.toml`
non viene mai pubblicato.

Ogni pagina di cartella include un pulsante **Scarica tutto**; ogni riga di
cartella o file ha inoltre un'icona di download a destra. Il download viene
creato nel browser: la pagina scarica i file della cartella selezionata e li
comprime in un archivio ZIP al momento del click.

## Deploy

Ogni push su `main` avvia `.github/workflows/deploy.yml`, che:

1. installa le dipendenze con Bun;
2. installa Typst;
3. esegue `bun run build:deploy` (validazione, staging, compilazione Typst,
   build Astro e split in `dist-public/` e `dist-admin/`);
4. pubblica `dist-public/` sul progetto `marini-didattica-materiale` e
   `dist-admin/` sul progetto `marini-didattica-admin`.

Servono i secret di repository `CLOUDFLARE_API_TOKEN` e
`CLOUDFLARE_ACCOUNT_ID`. Il progetto admin deve avere le variabili
`ADMIN_USER` e `ADMIN_PASS` (quest'ultima come secret); senza, il worker
risponde `503` e non serve alcun contenuto. Imposta `DEPLOY_ADMIN=true` solo
quando le credenziali sono configurate. Vedi `../workspace-meta/CLOUDFLARE.md`.

## Submodule

La cartella `typst-components/` è un submodule Git del pacchetto Typst
condiviso (tema, componenti e template). Dopo il clone:

```sh
git submodule update --init --recursive
# per allinearli all'ultima main:
git submodule update --remote --merge
```

## Privacy

La parte riservata per gli studenti non è autenticata: i codici sono difficili
da indovinare, ma chi conosce l'URL può aprire il materiale. È lo stesso modello
del precedente repository `riservato`.

Il materiale del docente (cartella `admin` in `students.json`, marcata
`"staff": true`) è invece pubblicato solo sul progetto `marini-didattica-admin`
e protetto da una pagina di login con sessione firmata. Il repository
`materiale` deve restare **privato**: i codici e i sorgenti riservati sono nel
repository, non solo nel sito.
