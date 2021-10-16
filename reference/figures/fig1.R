png("fig1.png", unit="in", width=4, height=4, res=120, pointsize=10)
par(mar=rep(1,4))
x <- c(0, 1)
y <- c(0, 1)
delta <- diff(range(x))/20
epsilon <- delta/10
plot(x, y, axes=FALSE, xlab="", ylab="",
    asp=1, type="n", xlim=c(-0.1,1.1), ylim=c(-0.1,1.1))
lines(rep(1, 2), c(0, 1), lwd=5, col="gray")
text(1-epsilon, 1, "Object", font=2, pos=3)
arrows(1+delta,0,1+delta,0.45,code=1, length=0.1)
arrows(1+delta,0.5+delta,1+delta,1, code=2, length=0.1)
text(1+delta, 0.5, "H")
box(col=4)
abline(h=0)
#lines(rep(1,2), c(0,1), lwd=4, col="darkgray")
#points(0,0,pch=20,col=2)
#text(0.1,0.09,expression(phi), pos=1, cex=1.4)
#lines(c(0, 1), c(0, 1))
points(0.5,0,pch=20)
text(0.57,0.09,expression(theta), pos=1, cex=1.4)
lines(c(0.5, 1), c(0, 1)) # ok

arrows(0.5+epsilon,-delta, 0.7, -delta, code=1, length=0.1)
arrows(0.8,-delta, 1, -delta, code=2, length=0.1)
text(0.75, -delta, expression(L))

theta <- atan2(1, 1-0.5)
phi <- atan2(1, 1)
L2 <- 50
H <- L2 * tan(theta)*tan(phi)/(tan(theta)-tan(phi))
stopifnot(abs(H == 100) < 1e-7)
message(sprintf("Example: L_2=%g, theta=%.4g deg, phi=%.4g deg yields H=%g (expect H=%g)",
        L2, theta*180/pi, phi*180/pi, H, 100))

