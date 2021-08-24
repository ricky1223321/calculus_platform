# 2.1 
require(mosaic)
plotFun(3*x-2 ~ x, xlim = range(0,10))
plotFun(m*x+b ~ x, xlim = range(0,10),m=3, b=-2)

# plotFun畫出function的plot，變數.lim設定變數範圍，也可直接設定參數，col顏色
# A*x^2 ~ x，x作為函式的input
plotFun(A*x^2 ~ x, x.lim = range(-2,3), A=10)
plotFun(5*x^2 ~ x, add=TRUE, col="red")
plotFun(cos(t) ~ t,add = TRUE,col = "orange", t.lim=range(0,4*pi))

# makeFun給函數設定名稱
f = makeFun(5*x^2 ~ x)
f(x=2)

g = makeFun(2*x^2 - 5*x + 2 ~ x)
plotFun(sqrt(abs(g(x))) ~ x, x.lim=range(-5,5), col="red")

# ex2
# a
plotFun(4*x-7 ~ x, x.lim=range(0,10))
# b
plotFun(cos(5*x) ~ x, xlim = range(-1,1))
# c
plotFun(cos(2*t) ~ t, t.lim = range(0,5))
# d
plotFun(sqrt(t)*cos(5*t) ~ t, tlim = range(0,5))

# ex6
plotFun(3*x ~ x, xlim=range(1,4))
plotFun(3*x ~ x, xlim=14)


# 2.2
data("mtcars")
plotPoints(mpg ~ wt, data = mtcars)
plotFun(3*wt ~ wt, wt.lim = range(1,6),add=TRUE)
plotFun(4*wt ~ wt, wt.lim = range(1,6),add=TRUE)
plotFun(5*wt ~ wt, wt.lim = range(1,6),add=TRUE)
plotFun(wt^2+wt ~ wt, wt.lim = range(1,6),add=TRUE)
plotFun(wt^3+wt^2+wt ~ wt, wt.lim = range(1,6),add=TRUE)


# 2.3
h = function(x){3*x + 5}
h(2)

g = function(x,y,z){x^2+3*y+sqrt(z)}
g(4,5,6)


# 2.4
plotFun(95-73*exp(-.2*t) ~ t, t.lim = range(0,20))
plotFun( sin(2*pi*t/10)*exp(-.2*x) ~ t & x, t.lim=range(0,20), x.lim= range(0,10))
plotFun( sin(2*pi*t/10)*exp(-.2*x) ~ t & x, t.lim=range(0,20), x.lim= range(0,10), filled = FALSE)
plotFun( sin(2*pi*t/10)*exp(-.2*x) ~ t & x, t.lim=range(0,20), x.lim= range(0,10), surface = TRUE)

g = makeFun( sin(2*pi*t/10)*exp(-.2*x) ~ t & x)
plotFun(g(t=t,x=x) ~ t & x, t.lim=range(0,20), x.lim=range(0,10))
g(7,4)
g(t=7,x=4)


# 2.5
# fetch package安裝 : https://stackoverflow.com/questions/34069842/fetchdata-function-no-longer-in-mosaic-package
pine = fetch::fetchData("Loblolly")
plotPoints(height ~ age ,data = pine)
?spliner
# spliner(cubic spline) : 三次樣條插植
# connector(linear interpolant) : 線性插植
# https://mropengate.blogspot.com/2015/04/cubic-spline-interpolation.html
f1 = spliner(height ~ age ,data = pine)
f2 = connector(height ~ age ,data = pine)
plotFun(f1(age) ~ age, age.lim=range(0,30))
plotFun(f2(age) ~ age, add=TRUE, col="red")
plotPoints(height ~ age, data = pine, add = TRUE)

cherry = fetch::fetchData("trees")
plotPoints(Volume ~ Girth, data=cherry)
g1 = spliner(Volume ~ Girth, data=cherry)
g2 = connector(Volume ~ Girth, data=cherry)
plotFun(g1(x) ~ x, x.lim=range(8,18), xlab = "Girth(inches)")
plotFun(g2(x) ~ x, add=TRUE, col="red")
plotPoints(Volume ~ Girth, data=cherry,add = TRUE)

# span越高，曲線越平滑
g3 = smoother(Volume~Girth, data=cherry, span = 0.5)
plotFun(g3(x) ~ x, x.lim=range(8,18), xlab='Girth(inches')
plotPoints(Volume~Girth, data=cherry, add = TRUE)

g4 = smoother(Volume~Girth, data=cherry, span = 1)
plotFun(g4(x) ~ x, x.lim=range(8,18), xlab='Girth(inches')
plotPoints(Volume~Girth, data=cherry, add = TRUE)

g5 = smoother(Volume~Girth, data=cherry, span = 0.4)
plotFun(g5(x) ~ x, x.lim=range(8,18), xlab='Girth(inches')
plotPoints(Volume~Girth, data=cherry, add = TRUE)

g6 = smoother(Volume ~ Girth+Height, data=cherry,span=1.0)
plotFun(g6(g,h) ~ g & h, g.lim=range(8,18), h.lim=range(60,90))


# 3
# linear parameters
u = fetch::fetchData("utilities.csv")
plotPoints(ccf ~ temp, data = u)
f = fitModel(ccf ~ A*temp + B, data = u)
plotFun(f(temp) ~ temp, temp.lim=range(0,80))
plotPoints(ccf ~ temp, data=u, add = TRUE)

f2 = fitModel(ccf ~ A*temp + B + C*sqrt(temp), data = u)
plotFun(f2(temp)~temp, temp.lim=range(0,80))
plotPoints(ccf ~ temp, data = u, add=TRUE)

hondas = fetch::fetchData("used-hondas.csv")
head(hondas)
carPrice1 = fitModel(Price ~ A + B*Age + C*Mileage, data = hondas)
plotFun(carPrice1(Age=age, Mileage=miles) ~ age & miles, age.lim=range(2,8), miles.lim=range(0,60000))

carPrice2 = fitModel(Price ~ A+B*Age+C*Mileage+D*Age*Mileage,data=hondas)
plotFun(carPrice2(Age = age, Mileage = miles) ~ age & miles, age.lim=range(0,10), miles.lim=range(0,100000))

# nonlinear parameters
inc = fetch::fetchData("Income-Housing.csv")
head(inc)
plotPoints(TwoVehicles ~ Income, data=inc)
kguess = log(0.5)/25000
f = fitModel(TwoVehicles ~ A+B*exp(k*Income), data = inc, start = list(A=100, B=-100, k=log(0.5)/25000))
plotFun(f(Income) ~ Income, Income.lim=range(0,100000))
plotPoints(TwoVehicles ~ Income, data=inc,add=TRUE)
f(Income = inc$Income)
# resids : actual value - predict value
resids = inc$TwoVehicles - f(Income = inc$Income)
# sum of square residuals is the distance between function and data
distance = sum(resids^2)


# 4.1
plotFun(sin(x^2)*cos(sqrt(x^4+3)-x^2)-x+1 ~ x, x.lim = range(-3,3))
# http://sas-and-r.blogspot.com/2012/03/example-922-shading-plots-and.html
ladd(panel.abline(h=0,col='gray50'))
plotFun(sin(x^2)*cos(sqrt(x^4+3)-x^2)-x+1 ~ x, x.lim = range(1,2))
ladd(panel.abline(h=0,col='gray50'))
# 找出function = 0 的位置
findZeros(sin(x^2)*cos(sqrt(x^4+3)-x^2)-x+1 ~ x, x.lim = range(1,2))
findZeros( exp(k*t) - 2^(b*t) ~ b, k=0.00035, t=1, b.lim=range(-Inf,Inf))
# function有多組解
findZeros( sin(x)-0.35 ~ x, x.lim=range(-20,20) )



# 4.2

# x +5y=1
# 2x-2y=1
# 4x+0y=1
b=c(1,1,1)
v1=c(1,2,4)
v2=c(5,-2,0)
project(b ~ v1+v2)
# projected value
0.32894737*v1 + 0.09210526*v2
# residual
b - (0.32894737*v1 + 0.09210526*v2)

cars = fetch::fetchData("cardata.csv")
head(cars)
project(mpg ~ 1+pounds+horsepower, data=cars)
lm(mpg ~ 1+pounds+horsepower, data=cars)
fmpg = fitModel(mpg ~ A+B*pounds+C*horsepower, data = cars)
fmpg(pounds = 3200, horsepower = 180)

plotFun(fmpg(horsepower=h, pounds=p) ~ h, h.lim=range(50,300), p=4000)
#plotFun(fmpg(horsepower=h, pounds=p) ~ h, p=2000,add = TRUE,col="red")

bomb = fetch::fetchData("blastdata.csv")
project( log(radius) ~ 1+log(time), data=bomb)
BombRadius = fitModel(radius ~ A*time^b, data=bomb, start=list(A=exp(6.295), b=0.3866))
plotPoints(radius ~ time, data=bomb)
plotFun(BombRadius(time) ~ time, add = TRUE)


# 5
x = "2*x"
f = makeFun(x)
plotFun(f(x) ~ x, x.lim=range(0,10))
?makeFun
?rnorm

library(functional)
require(mosaic)
mgf = function(stringFormula, from=NULL, to=NULL)
{
  f = function(x) eval(parse(text=stringFormula))
  integrate(f, lower=from, upper=to)[[1]]
  g = makeFun(f(x) ~ x)
  plotFun(g(x=x)~x, x.lim=range(from,to))
}
mgf("x^2-x^4", from=-10, to=10)
x = expression(x^2,'x')
ans = D(x,'x')
typeof(ans)
ans = toString(ans)
ans
typeof(ans)
typeof("dfsdf")
dif = function(stringFormula){
  f = function(x) eval(parse(text=stringFormula))
  g = expression(f,'x')
  return(D(g,'x'))
}


f = function(x) D(parse(text=x), "x")
y1 = f("x^2")
typeof(y1)
y1 = toString(y1)
y1


mgf = function(stringFormula, from=NULL, to=NULL)
{
  f = function(x) eval(parse(text=stringFormula))
  ans = integrate(f, lower=from, upper=to)[[1]]
  return(ans)
}
mgf("x^2",0,10)