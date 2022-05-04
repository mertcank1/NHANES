data{
  vector[2] m;
  cov_matrix[2] Sigma;
  int<lower=0> N[14];  
  int<lower=0> y[14];
  int sex[14];
  int waves_1[14];
  int waves_2[14];
  int waves_3[14];
  int waves_4[14];
  int waves_5[14];
  int waves_6[14];
  }
parameters {
vector<lower=0>[2] beta;
  real intercept;
  real sexeffect;
  real wave_1effect;
  real wave_2effect;
  real wave_3effect;
  real wave_4effect;
  real wave_5effect;
  real wave_6effect;
  real interaction_1;
  real interaction_2;
  real interaction_3;
  real interaction_4;
  real interaction_5;
  real interaction_6;
}

transformed parameters{
  real<lower=0,upper=1> theta[14];
  real<lower=0,upper=1> prev[14];
  
  vector[2] sensspec;
sensspec = inv_logit(beta);

for (i in 1:14) {
prev[i] = inv_logit(intercept + sexeffect * sex[i] + wave_1effect * waves_1[i] + waves_1[i]*sex[i]*interaction_1+ wave_2effect * waves_2[i]+ waves_2[i]*sex[i]*interaction_2 + wave_3effect * waves_3[i]+ waves_3[i]*sex[i]*interaction_3 +wave_4effect  * waves_4[i] + waves_4[i]*sex[i]*interaction_4 + wave_5effect * waves_5[i]+ waves_5[i]*sex[i]*interaction_5 +wave_6effect* waves_6[i]+ waves_6[i]*sex[i]*interaction_6); 
theta[i] = prev[i] * sensspec[2] + (1-prev[i]) * (1-sensspec[1]);
}

}

  model {
  intercept ~ normal(0,1);
  sexeffect ~ normal(0,5);
  wave_1effect ~ normal(0,5);
  wave_2effect ~ normal(0,5);
  wave_3effect ~ normal(0,5);
  wave_4effect ~ normal(0,5);
  wave_5effect ~ normal(0,5);
  wave_6effect ~ normal(0,5);
  interaction_1~ normal(0,5);
  interaction_2~ normal(0,5);
  interaction_3~ normal(0,5);
  interaction_4~ normal(0,5);
  interaction_5~ normal(0,5);
  interaction_6~ normal(0,5);
  beta ~ multi_normal(m, Sigma);
 for (i in 1:14) {
  y[i] ~ binomial(N[i], theta[i]);
 }
  
  }
