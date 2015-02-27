n <- 200

dev.print(pdf, "toy_line_plot.pdf")
a  <-  2
b  <-  34
sig_sq  <- 12.35
getwd()
x  <- runif(n)

y  <-  a + b*x + rnorm(n, sd= sqrt(sig_sq))
(avg_x  <-  mean(x))
write(avg_x, 'avg_x.txt')
plot(x, y)
abline(a, b, col = 'purple')
dev.print(pdf, "toy_line_plot.pdf")