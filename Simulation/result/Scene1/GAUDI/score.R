library(readr)

args = commandArgs(trailingOnly = T)

dat = "test"

geno_afr = read_delim(paste0("../../../genotype/",dat,"/X_afr.txt"), delim=" ", col_names=F)

geno_eur = read_delim(paste0("../../../genotype/",dat,"/X_eur.txt"), delim=" ", col_names=F)

ind = read.table(paste0("../../../genotype/",dat,"/ind.list"))
snplist = read.table(paste0("../../../genotype/",dat,"/test.bim"))


for (i in 1:10) {
    a = readRDS(paste0("sim_",i,".best_list.RDS"))

    snp = a$fit_model$snps
    pop = sapply(strsplit(snp, "_"), function(x) x[2])
    id = sapply(strsplit(snp, "_"), function(x) x[1])
    id_afr = id[pop=="AFR"]
    id_eur = id[pop=="EUR"]

    idx = which(a$fit_model$fit$lambda == a$fit_model$best_lambda)
    beta = a$fit_model$fit$beta[,idx]

    G_afr = t(as.matrix(geno_afr[match(id_afr, snplist[,2]),])) %*% beta[pop=="AFR"]
    G_eur = t(as.matrix(geno_eur[match(id_eur, snplist[,2]),])) %*% beta[pop=="EUR"]

    Y = G_afr + G_eur
    ind[,2] = Y

    system("mkdir -p ../predict/GAUDI/")
    write.table(ind, file=paste0("../predict/GAUDI/sim_",i,".profile"), row.names=F, col.names=F, quote=F, append=F, sep=" ")
}
