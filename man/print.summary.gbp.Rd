\name{print.summary.gbp}
\alias{print.summary.gbp}
\title{Displaying 'summary.gbp' Class}
\description{
\code{summary(gbp.object)} enables users to see a compact summary of estimation result.
}
\usage{\method{print}{summary.gbp}(x, ...)}
\arguments{
  \item{x}{
    a resultant object of \code{gbp} function. 
  }
  \item{...}{
    further arguments passed to other methods.
  }
}

\details{
  The summary has three parts depending on the model fitted by \code{gbp}; \code{Main Summary}, \cr\code{Second-level Variance Component Estimation Summary}, and \code{Regression Summary} (if fitted).

  A display of \code{Main Summary} changes depending on whether all the groups (units) has the same standard error for Gaussian data (or the same total number of trials for Binomial and Poisson data). If they are not the same, 
\code{Main Summary} lists groups (units) with minimum, median, and maximum values of the standard error for Gaussian data (or of the total number of trials for Binomial and Poisson data). And the last row of \code{Main Summary} is about the overall average for all the groups (units) within each column. Note that this last row is not an average over displayed groups (units) above.

  If groups (units) have the same standard error for Gaussian (or the same total number of trials for Binomial and Poisson), \code{Main Summary} lists groups (units) with minimum, median, and maximum values of the sample mean. 

  For reference, if there are several units with the same median value, they will show up with numbering.

  The second part is about the \code{Second-level Variance Component Estimation Summary}. For reference, the second level variance component can be interpreted as variation among the first-level parameters (\eqn{\theta_{j}}{\theta_j}) or variance in ensemble information. It is \emph{A} for Gaussian, \eqn{\frac{\mu_{0j}}{r}}{\mu0_j / r} for Poisson, and \eqn{\frac{\mu_{0j}(1 - \mu_{0j})}{r}}{\mu0_j (1 - \mu0_j) / (r + 1)} for Binomial data. To be specific, this part shows estimate of \eqn{\alpha} (a posterior mode) defined as log(\emph{A}) for Gaussian or log(\eqn{\frac{1}{r}}{1 / r}) for Binomial and Poisson data, and its standard error. 

  The last part depends on whether \code{gbp} fitted a regression or not. For reference, \code{gbp} fits a regression if the second-level mean (\code{mean.PriorDist}) was not designated. In this case, \code{summary(gbp.object)} will display the result of regression fit.

}
\value{
  \code{summary(gbp.object)} shows a compact summary of estimation result such as:
  \item{Main summary}{
    \describe{
      \item{Unit w/ min(se or n)}{an estimation result of a group (unit) with the minimum standard error for Gaussian or the minimum total number of trials for Binomial and Poisson data.}
      \item{Unit w/ min(sample.mean)}{appears instead of \code{Group w/ min(se or n)} when all the groups (units) have the same standard error for Gaussian or the same total number of trials for Binomial and Poisson data.}
      \item{Unit w/ median(se or n)}{an estimation result of group(s) (unit(s)) with the median standard error for Gaussian or the median total number of trials for Binomial and Poisson data.}
      \item{Unit w/ median(sample.mean)}{appears instead of \cr \code{Group w/ median(se or n)} when all the groups (units) have the same standard error for Gaussian or the same total number of trials for Binomial and Poisson data.}
      \item{Unit w/ max(se or n)}{an estimation result of a group (unit) with the maximum standard error for Gaussian or the maximum total number of trials for Binomial and Poisson data.}
      \item{Unit w/ max(sample.mean)}{appears instead of \code{Group w/ max(se or n)} when all the groups (units) have the same standard error for Gaussian or the same total number of trials for Binomial and Poisson data.}
      \item{Overall Means}{the overall average for all the groups (units) within each column.}
    }
  }
  \item{Second-level Variance Component Estimation Summary}{
    \describe{
      \item{post.mode.alpha}{a posterior mode of \eqn{\alpha} defined as log(\emph{A}) for Gaussian or log(\eqn{\frac{1}{r}}{1 / r}) for Binomial and Poisson data.}
      \item{post.sd.alpha}{standard deviation of the posterior distribution of alpha}
      \item{post.mode.r}{posterior mode of either \eqn{r} for Bianomial and Poisson models or \eqn{A} for Gaussian model.}
      \item{post.median.alpha}{posterior median of \eqn{\alpha} for Bianomial model, if the accept-reject method is used.}
      \item{post.median.r}{posterior median of \eqn{r} for Bianomial model, if the accept-reject method is used.}
    }
  }
  \item{Regression Summary (if fitted)}{
    \describe{
      \item{estimate}{regression coefficient estimates.}
      \item{se}{estimated standard error of regression coefficients.}
      \item{z.val}{estimate / se.}
      \item{p.val}{two-sided p-values.}
    }
  }
}
  
\author{
  Hyungsuk Tak, Joseph Kelly, and Carl Morris
}

\examples{

  data(hospital)

  z <- hospital$d
  n <- hospital$n
  y <- hospital$y
  se <- hospital$se
  
  ###################################################################################
  # We do not have any covariates and do not know a mean of the prior distribution. #
  ###################################################################################

    ###############################################################
    # Gaussian Regression Interactive Multilevel Modeling (GRIMM) #
    ###############################################################

    g <- gbp(y, se, model = "gaussian")
    summary(g)

    ###############################################################
    # Binomial Regression Interactive Multilevel Modeling (BRIMM) #
    ###############################################################

    b <- gbp(z, n, model = "binomial")
    summary(b)

    ##############################################################
    # Poisson Regression Interactive Multilevel Modeling (PRIMM) #
    ##############################################################

    p <- gbp(z, n, mean.PriorDist = 0.03, model = "poisson")
    summary(p)

}

\keyword{methods}
