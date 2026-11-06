// Direct Typst entry point for the statistics PDF.
// For the CLI wrapper, which skips students without a correction file, run:
//   typst-components/bin/typst-stats <testo-folder> <correzioni-folder> <students>
#import "/typst-components/src/lib.typ": render-stats

// Shared exam: the test lives in prime/shared, corrections are class-specific.

#render-stats(
  path("../../../shared/esercitazione-1/testo"),
  path("../correzioni"),
  (
    "bertoldi-emma",
    "bottea-sofia",
    "bruni-martin",
    "caserotti-martin",
    "fantelli-federico",
    "ferrari-thomas",
    "fox-isabella",
    "grad-cristian-grigore",
    "inama-giulia",
    "larcher-diego",
    "melis-nicolò",
    "orrico-alessio",
    "pizzolla-francesco",
    "rizzi-lorenzo",
    "telini-greta",
    "valentini-luca",
    "ymeraj-leonard",
    "zaninetti-sara",
  ),
)
