data {
  int<lower = 1> N;
  int<lower = 0,upper = N> y[2];
}
parameters {
real<lower=0,upper=1> prev;
simplex[2] spe;
simplex[2] sen;
}

transformed parameters {
  simplex[2] theta;
  theta = prev * sen + (1-prev) * (1-spe); 
  }
model {
  prev ~ beta(1, 1);          // prior 
  spe[1] ~ beta(71.25, 3.75); 
  sen[1] ~ beta(4.41,13.31);
  spe[2] ~ beta(4.1, 1.76); 
  sen[2] ~ beta(21.96, 5.49);
  y~ multinomial(theta);
}
