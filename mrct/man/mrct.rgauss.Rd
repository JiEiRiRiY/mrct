% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mrct_functions.R
\name{mrct.rgauss}
\alias{mrct.rgauss}
\title{Random sample from Gaussian process}
\usage{
mrct.rgauss(
  x.grid,
  N,
  seed = 123,
  model,
  outliers,
  sigma = 1,
  l = 1,
  method = "linear"
)
}
\arguments{
\item{x.grid}{Numeric vector containing a uniform grid on which the process is defined.}

\item{N}{Integer number of observations to generate.}

\item{seed}{Integer (default is \eqn{123}).. Random seed for reprocudibility.}

\item{model}{Integer. Either \eqn{1, 2} or \eqn{3}. Corresponds to one of the three simulation settings.}

\item{outliers}{Integer vector containing the indices of outliers. If empty, then only regular curves will be generated.}

\item{sigma, l}{Numeric values with default equal to \eqn{1}. Parameters for the covariance kernel.}

\item{method}{Different types of covariance kernels. Possible options are "\code{quadratic}"
\deqn{\gamma(s,t) = \sigma \text{exp}\left(\frac{-(s-t)^2}{l}\right),}
"\code{linear}"
\deqn{\gamma(s,t) = \sigma \text{exp}\left(\frac{-|s-t|}{l}\right)}
or "\code{gaussian}" (default)
\deqn{\gamma(s,t) = \sigma^2 \text{exp}\left(\frac{-(s-t)^2}{2 l^2}\right)}.}
}
\value{
Numeric matrix with \eqn{N} rows and \code{length(x.grid)} columns containing the randomly generated curves following a Gaussian process.
Each observations is a row of the result.
}
\description{
Generate random samples of Gaussian process on a uniform grid for different settings of the simulation study in \insertCite{oguamalam2023minimum;nobrackets}{mrct}.
}
\examples{
# Fix seed for reproducibility
set.seed(123)

# Sample outlying indices
cont.ind <- sample(1:50,size=10)

# Generate 50 curves on the interval [0,1] at 50 timepoints with 20\% outliers
y <- mrct.rgauss(x.grid=seq(0,1,length.out=50), N=50 ,model=1,
                 outliers=cont.ind)

# Visualize curves (regular curves grey, outliers black)
colormap <- rep("grey",50); colormap[cont.ind] <- "black"
matplot(x=seq(0,1,length.out=50), y=t(y), type="l", lty="solid",
        col=colormap, xlab="t",ylab="")
}
\references{
\insertRef{oguamalam2023minimum}{mrct}.
}
