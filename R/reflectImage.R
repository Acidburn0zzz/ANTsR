#' reflectImage
#'
#' reflects an image along its axis
#'
#' @param img1 input object, an antsImage
#' @param axis which dimension to reflect across, numbered from 0 to imageDimension-1
#' @param tx transformation type to estimate after reflection
#' @param metric similarity metric for image registration.  see \code{antsRegistration}.
#' @author BB Avants
#' @seealso \code{\link{antsRegistration}}
#' @examples
#'
#' fi<-antsImageRead( getANTsRData("r16") , 2 )
#' axis = 2
#' asym<-reflectImage( fi, axis, "Affine" )$warpedmovout
#' asym<-asym-fi
#'
#' @export reflectImage
reflectImage<-function( img1, axis=NA, tx=NA, metric="mattes" ) {
  if ( is.na(axis) ) axis=( img1@dimension - 1 )
  if ( axis > img1@dimension | axis < 0 ) axis=(img1@dimension-1)

  rflct<-tempfile(fileext = ".mat")
  catchout = .Call( "reflectionMatrix", img1, axis, rflct, package="ANTsR")

  if ( ! is.na(tx) )
  {
  rfi<-invisible( antsRegistration( img1, img1, typeofTransform = tx,
    synMetric = metric,
    outprefix = tempfile(),
    initialTransform = rflct ) )
  return( rfi )
  }
  else
  {
  return( antsApplyTransforms( img1, img1, rflct  )  )
  }
}
