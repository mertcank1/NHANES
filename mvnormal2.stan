data{
  vector[2] m;
  cov_matrix[2] Sigma;
  int<lower=0> N[2];  
  int<lower=0> y[2];
  
}
parameters {
matrix[2,2] beta;
real<lower=0,upper=.5> prev[2];
}

transformed parameters{
  real<lower=0,upper=1> theta[2];
  matrix[2,2] sensspec;
  
  for (i in 1:2){
    sensspec[,i] = inv_logit(beta[,i]);
    theta[i]= prev[i] * sensspec[2,i] + (1-prev[i]) * (1-sensspec[1,i]);
    
  }
}
model {
  prev ~ beta(1, 1);// prior 
  for (i in 1:2) {
  y[i] ~ binomial(N[i], theta[i]);
  beta[,i] ~ multi_normal(m, Sigma);
  }
} 
  
 