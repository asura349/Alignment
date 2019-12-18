simpl.cal<- function(metric, sample.sq, wgt.sum) {
    num.group<- nrow(metric)
    num.item<- ncol(metric)
    
    comb<- t( utils::combn(num.group, 2) )
    
    simpl.val<- 0
    for (i in 1:num.item) {
        sub.sq<- ( metric[ comb[,1], i ] - metric[ comb[,2], i] )^2
        simpl.val<- simpl.val + choose(num.group, 2) * sample.sq[ comb[,1], i] * sample.sq[ comb[,2], i] / wgt.sum *
                    ( (sub.sq + 0.01)^(1/4) )
    }
    return( sum(simpl.val) )
}



# variance product = 1 constraint.
equal.const<- function(x) {
    h<- rep(NA,1)
    l<- ceiling(length(x)/2)
    
    h[1]<- prod(x[1:l]) - 1
    
    h
}



# positive variance constraint.
inequal.const<- function(x) {
    h<- rep(NA,1)
    l<- ceiling(length(x)/2)
    # lb = lower bound.
    lb<- 0.01
    
    for ( i in 1:l) { h[i]<- x[i] - lb }
    
    h
}
