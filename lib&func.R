############################################################################################################################################################

# REQUIRED LIBRARY.

############################################################################################################################################################

library(lavaan)
library(nloptr)
library(semTools)
library(ggplot2)
library(plyr)
library(reshape2)

############################################################################################################################################################

# FUNCTION DEFINITION.

############################################################################################################################################################

# model fit summary
fit.summary<- function(fit) { return(fitMeasures(fit, c("chisq", "df", "pvalue", "rmsea", "srmr", "CFI", "tli", "aic", "bic"))) }



extract.lambda0<- function(fit, item_n) {
    fit<- parameterEstimates(fit, standardized= T)
    
    # filtering estimatied loading value in model fitting result
    loading<- subset(fit, op== "=~")
    loading_est<- loading$est
    
    # save from loading estimation vector to loading matrix composed group number row * item number column 
    loading_matrix<- matrix(loading_est, byrow= T, ncol= item_n)
    
    # row, column naming
    rownames(loading_matrix)<- c( min(loading$group): max(loading$group))
    colnames(loading_matrix)<- loading$rhs[1:item_n]
    return(loading_matrix)
}



extract.nu0<- function(fit, item_n, factor) {
    fit<- parameterEstimates(fit, standardized= T)
    group_n<- max(fit$group)
    intercept<- subset(fit, op== "~1")
    
    # except factor mean
    intercept<- subset(intercept, lhs!= factor)
    
    # save intercept estimation vector
    intercept_est<- intercept$est
    
    # save from intercept estimation vector to intercept matrix composed group number row * item number column 
    intercept_matrix<- matrix(intercept_est, byrow= T, ncol= item_n)
    
    # row(group), column(item) naming
    rownames(intercept_matrix)<- c(1: group_n)
    # in intercept lhs = item name vector
    colnames(intercept_matrix)<- intercept$lhs[1:item_n]
    
    return(intercept_matrix)
}



geo.mean<- function(val) { return( prod(val)^( 1/length(val) ) ) }

# round
r<- function(val) { return( round(val,3) )}



odd<- function(val) {
    if (val%%2 == 0)
        return(TRUE)
    else
        return(FALSE)
}
