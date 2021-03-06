% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/abpBrainExtraction.R
\name{abpBrainExtraction}
\alias{abpBrainExtraction}
\title{An ants-based brain extraction script.}
\usage{
abpBrainExtraction(img = NA, tem = NA, temmask = NA, temregmask = NA,
  regtype = "SyN", tdir = NA)
}
\arguments{
\item{img}{whole head image to which we map a brain mask}

\item{tem}{Template image (the whole head) which has an associated label mask.}

\item{temmask}{Template's antsImage brain mask.}

\item{temregmask}{Template's registration mask including skull but not the face}

\item{regtype}{registration type: 'SyN' (fast, default), 'SyNabp' (better, slower)}

\item{tdir}{temporary directory (optional)}
}
\value{
outputs a brain image and brain mask.
}
\description{
Brain extraction based on mapping a template image and its mask to the input
image.  Should be preceded by abpN4.
}
\examples{

n = 64
fn<-getANTsRData("r16")
img<-antsImageRead(fn)
img<-resampleImage(img,c(n,n),1,0)
tf<-getANTsRData("r27")
tem<-antsImageRead(tf)
tem<-resampleImage(tem,c(n,n),1,0)
temmask<-antsImageClone( tem )
temmask[ tem  > 20 ] <- 1
temmask[ tem  <= 20 ] <- 0
bm<-abpBrainExtraction(img=img,tem=tem,temmask=temmask)

}
\author{
Tustison N, Avants BB
}
