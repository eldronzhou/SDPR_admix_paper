# effect size simulation
## EUR_EAS: Scene1
## EUR_AFR: Scene1

library(MASS) # mvrnorm
library(data.table)

print("Start!")
path_sim <- "./"

Scene = "Scene2"

# 15,357 SNPs
snp <- read.table("../genotype/AA/AA.pvar")[,3]

# scenario 1: 
M  <- length(snp) # size of SNP
h2s <- c(0.2, 0.1)
pi <- c(1-5e-2-5e-2-.1, 5e-2, 5e-2, .1)  
rho <- 0.8

sigmasq <- c((h2s[1] - min(h2s)*0.8)/(pi[1+1]*M), 
             (h2s[2] - min(h2s)*0.8)/(pi[1+2]*M), 
             min(h2s)*0.8/(pi[1+3]*M))
Sigma3 <- sigmasq[3] * matrix(c(1, rho, rho, 1), nrow = 2)

n_rep <- 10

# EUR_EAS
for (i in 1:n_rep) {
  print(paste0("Replicate: ", i))
  while (TRUE) {
    snp_ind <- sample(0:3, size = M, replace = T, prob = pi)
    beta_true <- data.frame(beta_true1 = rep(0, M),
                            beta_true2 = rep(0, M))
    beta_true[snp_ind == 1, "beta_true1"] <- rnorm(sum(snp_ind == 1), 0, sqrt(sigmasq[1]))
    beta_true[snp_ind == 2, "beta_true2"] <- rnorm(sum(snp_ind == 2), 0, sqrt(sigmasq[2]))
    beta_true[snp_ind == 3, c("beta_true1", "beta_true2")] <- mvrnorm(sum(snp_ind == 3), 
                                                                      c(0, 0), Sigma = Sigma3)

    if ((abs(sum(beta_true$beta_true1^2) - h2s[1]) < 1e-3) & 
        (abs(sum(beta_true$beta_true2^2) - h2s[2]) < 1e-3)) break
  }
  
  # AFR
  res1 = data.frame(snp_id = snp, 
                    effect = beta_true$beta_true1)
  
  # EUR
  res2 = data.frame(snp_id = snp, 
                    effect = beta_true$beta_true2)
  system(paste0("mkdir -p ",Scene,"/AFR/"))
  write.table(res1, 
              file=paste0(path_sim,Scene,"/AFR/sim_",i,".txt"), 
              append = F, quote = F, sep = "\t", row.names = F,
              col.names = F)
  print("Write AFR effect size.")
 
  system(paste0("mkdir -p ",Scene,"/EUR/"))
  write.table(res2, 
              file=paste0(path_sim,Scene,"/EUR/sim_",i,".txt"), 
              append = F, quote = F, sep = "\t", row.names = F,
              col.names = F)
  print("Write EUR effect size.")

  #write.table(snp_ind, file="sim_1.txt", row.names=F, col.names=F, quote=F, append=F)

}

print("Finish!")
