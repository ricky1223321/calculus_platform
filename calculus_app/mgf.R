mgf = function(stringFormula, from=NULL, to=NULL)
{
  f = function(x) eval(parse(text=stringFormula))
  g = makeFun(f(x) ~ x)
  plotFun(g(x=x)~x, x.lim=range(from,to))
}

dif = function(stringFormula){
  return(D(parse(text=stringFormula),"x"))
}

integration = function(stringFormula, from=NULL, to=NULL){
  f = function(x) eval(parse(text=stringFormula))
  ans = integrate(f, lower=from, upper=to)[[1]]
  return(ans)
}