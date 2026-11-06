// Direct Typst entry point for the statistics PDF.
// For the CLI wrapper, which skips students without a correction file, run:
//   typst-components/bin/typst-stats <testo-folder> <correzioni-folder> <students>
#import "/typst-components/src/lib.typ": render-stats

// Shared exam: the test lives in prime/shared, corrections are class-specific.

#render-stats(
  path("../../../shared/esercitazione-1/testo"),
  path("../correzioni"),
  (
    "angeli-lorenzo",
    "barbaro-arturo",
    "bertolini-florian",
    "branz-federico",
    "campi-gabriele",
    "dalpiaz-damian",
    "docuz-sara-maria",
    "fondriest-milena",
    "laccona-alessandro-massimo",
    "lorenzoni-chris",
    "malanotti-stefano",
    "melis-riccardo",
    "mesttchian-gabriel",
    "midjaiti-elif",
    "pellegrini-benedetta",
    "quatrale-lorenzo",
    "rosati-martino",
    "valentinelli-aurora",
  ),
)
