library(readr)

args = commandArgs(trailingOnly = T)
i = args[1] # repeat
j = args[2] # scene

h2 = 0.3

for (dat in c("discover","validate","test")) {

print(dat)

geno_afr = read_delim(paste0("../genotype/",dat,"/X_afr.txt"), delim=" ", col_names=F)

geno_eur = read_delim(paste0("../genotype/",dat,"/X_eur.txt"), delim=" ", col_names=F)

ind = read.table(paste0("../genotype/",dat,"/ind.list"))

beta_afr = read.table(paste0("../effect_size/",j,"/AFR/sim_",i,".txt"), header=F)

beta_eur = read.table(paste0("../effect_size/",j,"/EUR/sim_",i,".txt"), header=F)

G_afr = t(as.matrix(geno_afr)) %*% beta_afr[,2]

G_eur = t(as.matrix(geno_eur)) %*% beta_eur[,2]

epsilon = rnorm(nrow(G_afr), 0, sqrt(var(G_afr + G_eur) * (1 / h2 - 1)))

print(var(G_afr + G_eur))
print(var(G_afr + G_eur) * (1 / h2 - 1))

Y = G_afr + G_eur + epsilon

print(var(G_afr + G_eur) / var(Y))

ind[,2] = ind[,1]; ind[,3] = Y

system(paste0("mkdir -p ",j,"/",dat))
write.table(ind, file=paste0(j,"/",dat,"/sim_",i,".pheno"), row.names=F, col.names=F, quote=F, append=F, sep=" ")
}
