#' Brainnetome Atlas
#'
#' Brain atlas for the Brainnetome cortical parcellation with 105 regions
#' per hemisphere. Contains 2D polygon geometry for [ggseg::geom_brain()].
#'
#' @docType data
#' @name brainnetome
#' @usage data(brainnetome)
#' @keywords datasets
#' @family ggseg_atlases
#'
#' @references Fan L, Li H, Zhuo J, Zhang Y, Wang J, Chen L, Yang Z,
#'   Chu C, Xie S, Laird AR, Fox PT, Eickhoff SB, Yu C, Jiang T (2016).
#'   The Human Brainnetome Atlas: A New Brain Atlas Based on Connectional
#'   Architecture. *Cerebral Cortex*, 26(8):3508-3526.
#'   \doi{10.1093/cercor/bhw157}
#'
#' @format A [ggseg.formats::ggseg_atlas] object (cortical).
#' @examples
#' data(brainnetome)
#' brainnetome
"brainnetome"
