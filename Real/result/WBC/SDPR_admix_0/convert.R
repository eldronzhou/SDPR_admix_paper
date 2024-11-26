d = read.table("res.txt")
bim = read.table("../../../genotype/UKB/Ukb_imp_v2.bim")
d$id = paste0(d$V1,":",d$V2)
bim$id = paste0(bim$V1,":", bim$V4)
idx = match(d$id, bim$id)
d$id = bim[idx,2]
idx = which(is.na(d$id))
d = d[-idx,]
d$V3 = d$id
#write.table(d[,1:9], file="ss.txt", row.names=F, col.names=F, quote=F, append=F, sep="\t")
write.table(d[,1:7], file="res.txt", row.names=F, col.names=F, quote=F, append=F, sep="\t")
