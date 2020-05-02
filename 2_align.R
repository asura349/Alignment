simplicity<- function(lambda0, nu0, psi, alpha, sample) {
    
    num.group<- nrow(lambda0)
    num.item<- ncol(lambda0)
    comb<- t( utils::combn(num.group, 2) )
    
    sample.sq<- matrix( sqrt(sample), length(sample), ncol(lambda0))
    wgt.sum<- sum(sample.sq[comb[,1],1 ] * sample.sq[comb[,2],1 ])
    
    # lambda(loading) simplicity
    metric.load<- convert.metric.load(lambda0, psi)
    simpl.lambda<- simpl.cal(metric.load, sample.sq, wgt.sum)
    
    # nu(intercept) simplicity
    metric.int<- convert.metric.int(lambda0, nu0, psi, alpha)
    simpl.nu<- simpl.cal(metric.int, sample.sq, wgt.sum)
    
    # return total simplicity.
    return( simpl.lambda + simpl.nu )
}



convert.metric.load<- function( lambda, psi ) {
    
    num.item<- ncol(lambda)
    num.group<- nrow(lambda)
    metric.load<- lambda * Inf
    
    psi[psi<=0]<- 0.001
    
    for(i in 1:num.item) {
        for( j in 1:num.group) {
            metric.load[j,i]<- lambda[j,i] / ( mean(lambda[,i]) * sqrt( psi[j] ) )
        }
    }
    return(metric.load)
}



convert.metric.int<- function ( lambda, nu, psi, alpha ) {
    
    num.item<- ncol(lambda)
    num.group<- nrow(lambda)
    
    metric.int<- nu * Inf
    psi[psi<=0]<- 0.001
    
    for ( i in 1:num.item ) {
        for ( j in 1:num.group ) {
            metric.int[j,i]<- ( nu[j,i] - mean(nu[,i]) ) / mean(lambda[,i])
            metric.int[j,i]<- metric.int[j,i] - alpha[j] * lambda[j,i] / ( mean(lambda[,i]) * sqrt( psi[j] ) )
        }
    }
    return(metric.int)
}


    
back.transf.load<- function(metric.lambda, conf.lambda, metric.psi, metric="refgroup") {
    
    num.group<- nrow(metric.lambda)
    num.item<- ncol(metric.lambda)
    aligned.lambda<- metric.lambda * Inf
    
    for ( g in 1:num.group ) {
        for ( i in 1:num.item) {
            if (metric=="refgroup") {
                aligned.lambda[g,i]<- metric.lambda[g,i] * mean(conf.lambda[,i]) * sqrt(metric.psi[1]) }
            else { aligned.lambda[g,i]<- metric.lambda[g,i] * mean(conf.lambda[,i])  }
        }
    }
    return(aligned.lambda)
}



back.transf.int<- function(metric.nu, conf.lambda, conf.nu) {
    
    num.group<- nrow(metric.nu)
    num.item<- ncol(metric.nu)
    aligned.nu<- metric.nu * Inf
    
    for ( g in 1:num.group ) {
        for ( i in 1:num.item) {
            aligned.nu[g,i]<- metric.nu[g,i] * mean(conf.lambda[,i]) + mean(conf.nu[,i])
        }
    }
    return(aligned.nu)
}



back.transf.psi<- function(lambda0, lambda1) {
    
    num.group<- nrow(lambda0)
    aligned.psi<- rep(Inf, num.group)
    
    for ( g in 1:num.group ) {
        aligned.psi[g]<- (lambda0[g,1]/lambda1[g,1])^2 }
    return(aligned.psi)
}



back.transf.alpha<- function(nu0, nu1, lambda1) {

    num.group<- nrow(nu0)
    aligned.alpha<- rep(Inf, num.group)
    
    for ( g in 1:num.group ) {
        aligned.alpha[g]<- (nu0[g,1] - nu1[g,1]) / lambda1[g,1] }
    return(aligned.alpha)
}
