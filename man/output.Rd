% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/RecoSys.R
\name{output}
\alias{output}
\title{Output Factorization Matrices}
\arguments{
\item{r}{Object returned by \code{\link{Reco}()}}

\item{out_P}{Filename of the output user score matrix. Note that this contains
the \strong{transpose} of the \eqn{P} matrix, hence each row in
the file stands for a user, and each column stands for a latent
factor. Values are space seperated.}

\item{out_Q}{Filename of the output item score matrix. Note that this contains
             the \strong{transpose} of the \eqn{Q} matrix, hence each row in
             the file stands for an item, and each column stands for a latent
             factor. Values are space seperated.}
}
\description{
This method is a member function of class "\code{RecoSys}"
that could write the user score matrix \eqn{P} and item score matrix \eqn{Q}
to text files.

Prior to calling this method, model needs to be trained by calling
\code{$\link{train}()}.

The common usage of this method is
\preformatted{r = Reco()
r$output(out_P = file.path(tempdir(), "mat_P.txt"),
         out_Q = file.path(tempdir(), "mat_Q.txt"))}
}
\examples{
set.seed(123) # this is a randomized algorithm
trainset = system.file("dat", "smalltrain.txt", package = "recosystem")
testset = system.file("dat", "smalltest.txt", package = "recosystem")
r = Reco()
r$convert_train(trainset)
r$convert_test(testset)
r$train(opts = list(dim = 10))
P = tempfile()
Q = tempfile()
r$output(P, Q)

## Inspect these two matrices
head(read.table(P, header = FALSE, sep = " "))
head(read.table(Q, header = FALSE, sep = " "))
}
\author{
Yixuan Qiu <\url{http://statr.me}>
}
\references{
LIBMF: A Matrix-factorization Library for Recommender Systems.
\url{http://www.csie.ntu.edu.tw/~cjlin/libmf/}

Y. Zhuang, W.-S. Chin, Y.-C. Juan, and C.-J. Lin.
A Fast Parallel Stochastic Gradient Method for Matrix Factorization in Shared Memory Systems.
Technical report 2014.
}
\seealso{
\code{\link{convert}}, \code{\link{train}}, \code{\link{predict}}
}

