// Direct Typst entry point for the statistics PDF.
// For the CLI wrapper, which skips students without a correction file, run:
//   typst-components/bin/typst-stats <test-folder> <students>
#import "/typst-components/src/lib.typ": render-stats

#render-stats(
  path(".."),
  (
    "battocletti-alessandro",
    "bonetti-alessandra",
    "dagostin-davide",
    "dal-savio-daniele",
    "ferrari-carlo",
    "filippi-renato",
    "lorenzi-diego",
    // "mezzena-nicolò",
    "moscon-laura",
    "panizza-stella",
    "penasa-gemma",
    "perazzolli-gianluca",
    "pilloni-francesco",
    "pretti-agata",
    "sesureac-milena",
    "veronesi-davide",
    "visintainer-filippo",
    "vurchio-riccardo",
    "zambelli-giovanni",
    "zuech-gabriele",
  ),
)
