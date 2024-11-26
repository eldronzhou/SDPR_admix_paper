
for (i in 1:10) {
    a = read.table(paste0("sim_",i,".pheno"))
    b = read.table("../../../genotype/discover/gemma/discover.sample", header=T)
    b = b[-1,]
    b$y = NA
    idx = match(a$V2, b$ID_2)
    b[idx,"y"] = a[,3]
    write.table(b$y, file=paste0("gemma/sim_",i,".pheno"), row.names=F, col.names=F, quote=F, append=F)
}
