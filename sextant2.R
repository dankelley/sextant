rm(list=ls())
if (!interactive())
    pdf("sextant2.pdf", width=11, height=8.5, paper="USr")
d1 <- 10                               # big segments
d2 <- 5                                # medium segments
d3 <- 1                                # small segments
theta1 <- seq(180, 360, d1) * pi/180
theta2 <- seq(180, 360, d2) * pi/180
theta3 <- seq(180, 360, d3) * pi/180
x0 <- 0
y0 <- 0
R <- 1
x1 <- x0 + R * cos(theta1)
y1 <- y0 + R * sin(theta1)
x2 <- x0 + R * cos(theta2)
y2 <- y0 + R * sin(theta2)
x3 <- x0 + R * cos(theta3)
y3 <- y0 + R * sin(theta3)

par(mar=rep(0.5, 4))
plot(x1, y1, asp=1, pch=20, cex=0.5, type="n", yaxs="i", axes=FALSE,
    xlab="", ylab="")
box()
e1 <- 0.960
e2 <- 0.970
e3 <- 0.985
e4 <- 0.93
lines(x3, y3)
xcut <- c(x3[1], x3, tail(x3, 1), x3[1])/e3
ycut <- c(R/10, y3, R/10, R/10)/e3
lines(xcut, ycut, col="gray")
lwd1 <- 2.0
lwd2 <- 1
lwd3 <- 0.9
segments(x1, y1, e1*x1, e1*y1, lwd=lwd1)
segments(x2, y2, e2*x2, e2*y2, lwd=lwd2)
segments(x3, y3, e3*x3, e3*y3, lwd=lwd3)
points(x0, y0, pch=20)
text(x0, y0+0.5*R/10, "P")
points(x0+R, y0, pch=20)
text(x0+R, y0+0.5*R/10, "S")
D <- 10
mark <- seq(D, 90, D)
mark[length(mark)] <- NA # chop out -90 and +90
look <- x1 > 0
text(0, -e4*R, "0")
text(e4*x1[look], e4*y1[look], mark)
text(-e4*x1[look], e4*y1[look], mark)
lines(range(x1), rep(0, 2))

if (!interactive())
    dev.off()

