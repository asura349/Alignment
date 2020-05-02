align.main<- function(fit, num.item, factor, samplesize) {
    
    t0<- Sys.time()
    
    num.group<- length(samplesize)
    lambda0<- extract.lambda0(fit, num.item)
    
    # factor = factor name string.
    nu0<- extract.nu0(fit, num.item, factor)
    
    est.init<- c(rep(1, num.group), rep(0, (num.group-1)) )
    
    target.func<- function(est, lambda= lambda0, nu= nu0, sample= samplesize) {
        half<- ceiling(length(est)/2)
        l<- length(est)
        
        psi<- est[ 1 : half ]
        alpha<- est[ (half+1) : l]
        
        simpl.val<- simplicity(lambda0= lambda, nu0= nu, psi, c(0,alpha), sample)
        return(simpl.val)
    }
    
    t1<- Sys.time()
    rst<- nloptr::auglag(x0= est.init, fn= target.func, localsolver= c("SLSQP") , heq= equal.const, hin= inequal.const)
    t2<- Sys.time()
    
    # result summary.
    # metric solution.
    metric.var<- rst$par[1: num.group]
    metric.mean<- c( 0, rst$par[ (num.group+1): length(est.init) ] )
    metric.load<- convert.metric.load(lambda0, metric.var)
    metric.int<- convert.metric.int(lambda0, nu0, metric.var, metric.mean)
    
    # aligned solution.
    aligned.var.ref<- back.transf.psi(lambda0, aligned.load.ref)
    aligned.mean.fixed<- back.transf.alpha(nu0, aligned.int.fixed, aligned.load.ref)
    aligned.load.ref<- back.transf.load(metric.load, lambda0, metric.var, metric="refgroup")
    aligned.int.fixed<- back.transf.int(metric.int, lambda0, nu0)    
    
    t9<- Sys.time()
    
    # return result in list form.
    result<- list(simplicity= rst$value,
                  
                  metric.variance= metric.var, metric.mean= metric.mean,
                  metric.loading= metric.load, metric.intercept= metric.int,
                  
                  aligned.loading.refgroup= aligned.load.ref, aligned.intercept.fixed= aligned.int.fixed,
                  aligned.variance.refgroup= aligned.var.ref, aligned.mean.fixed= aligned.mean.fixed,
                  
                  opt.time= t2-t1, total.time= t9-t0)
    
    return(result)
}
