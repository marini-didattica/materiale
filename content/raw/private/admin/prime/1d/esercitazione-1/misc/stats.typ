// Direct Typst entry point for the statistics PDF.
// The manifest at ../manifest.json provides the test path and defaults; every
// student in the class roster must have a file in ../correzioni/.
#import "/typst-components/src/lib.typ": render-stats

#render-stats(path("../correzioni"))
