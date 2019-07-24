#----------------------------------------------------------------------------------------------------
#' @import methods
#' @import TrenaProject
#' @importFrom AnnotationDbi select
#' @import org.Mm.eg.db
#'
#' @title TrenaProjectMouseTCEx-class
#'
#' @name TrenaProjectMouseTCEx-class
#' @rdname TrenaProjectMouseTCEx-class
#' @aliases TrenaProjectMouseTCEx
#' @exportClass TrenaProjectMouseTCEx
#'

.TrenaProjectMouseTCEx <- setClass("TrenaProjectMouseTCEx", contains="TrenaProjectMM10")

#----------------------------------------------------------------------------------------------------
#' Define an object of class TrenaProjectMouseTCEx
#'
#' @description
#' Expression, variant and covariate data for the genes of interest (perhaps unbounded) for pre-term birth studies
#'
#' @rdname TrenaProjectMouseTCEx-class
#'
#' @export
#'
#' @return An object of the TrenaProjectMouseTCEx class
#'

TrenaProjectMouseTCEx <- function(quiet=TRUE)

{
   genomeName <- "mm10"

   directory <- system.file(package="TrenaProjectMouseTCEx", "extdata", "geneSets")
   geneSet.files <- list.files(directory)
   geneSets <- list()
   for(file in geneSet.files){
      full.path <- file.path(directory, file)
      genes <- scan(full.path, sep="\t", what=character(0), quiet=TRUE)
      geneSet.name <- sub(".txt", "", file)
      geneSets[[geneSet.name]] <- genes
      }

   footprintDatabaseNames <- NA_character_;
   expressionDirectory <- system.file(package="TrenaProjectMouseTCEx", "extdata", "expression")
   variantsDirectory <- system.file(package="TrenaProjectMouseTCEx", "extdata", "variants")
   footprintDatabaseHost <- NA_character_;
   geneInfoTable.path <- NA_character_;
   genomicRegionsDirectory <- NA_character_;
   covariatesFile <- NA_character_;

   stopifnot(file.exists(expressionDirectory))

  .TrenaProjectMouseTCEx(TrenaProjectMM10())

} # TrenaProjectMouseTCEx, the constructor
#----------------------------------------------------------------------------------------------------
