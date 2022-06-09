data{
  vector[2] m;
  cov_matrix[2] Sigma;
  int<lower=0> N[14];  
  int<lower=0> y[14];
  int sex[14];
  int waves_2[14];
  int waves_3[14];
  int waves_4[14];
  int waves_5[14];
  int waves_6[14];
  int waves_7[14];
  }
parameters {
vector<lower=0>[2] beta;
  real intercept;
  real sexeffect;
  real wave_effect[6];
  real interaction[6];
}

transformed parameters{
  real<lower=0,upper=1> theta[14];
  real<lower=0,upper=1> prev[14];
  
  vector[2] sensspec;
sensspec = inv_logit(beta);

for (i in 1:14) {
prev[i] = inv_logit(intercept + sexeffect * sex[i] + wave_effect[1] * waves_2[i]+ waves_2[i]*sex[i]*interaction[1] + wave_effect[2] * waves_3[i]+ waves_3[i]*sex[i]*interaction[2] +wave_effect[3]  * waves_4[i] + waves_4[i]*sex[i]*interaction[3] + wave_effect[4] * waves_5[i]+ waves_5[i]*sex[i]*interaction[4] +wave_effect[5]* waves_6[i]+ waves_6[i]*sex[i]*interaction[5]+ wave_effect[6] * waves_7[i] + waves_7[i]*sex[i]*interaction[6]); 
theta[i] = prev[i] * sensspec[2] + (1-prev[i]) * (1-sensspec[1]);
}

}

  model {
  intercept ~ normal(0,1);
  sexeffect ~ normal(0,5);
  wave_effect ~ normal(0,5);
  interaction~ normal(0,5);
  beta ~ multi_normal(m, Sigma);
 for (i in 1:14) {
  y[i] ~ binomial(N[i], theta[i]);
 }
  
  }
