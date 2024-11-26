library(readr)

args = commandArgs(trailingOnly = T)

dat = "test"

geno_afr = read_delim(paste0("../../../genotype/",dat,"/X_afr.txt"), delim=" ", col_names=F)

geno_eur = read_delim(paste0("../../../genotype/",dat,"/X_eur.txt"), delim=" ", col_names=F)

ind = read.table(paste0("../../../genotype/",dat,"/ind.list"))

for (i in 1:10) {
    beta = read.table(paste0("sim_",i,".txt"), header=F, sep="\t")

    G_afr = t(as.matrix(geno_afr)) %*% beta[,1]
    G_eur = t(as.matrix(geno_eur)) %*% beta[,2]

    Y = G_afr + G_eur
    ind[,2] = Y

    system("mkdir -p ../predict/SDPR/")
    write.table(ind, file=paste0("../predict/SDPR/sim_",i,".profile"), row.names=F, col.names=F, quote=F, append=F, sep=" ")
}
