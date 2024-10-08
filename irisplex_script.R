library(data.table)
library(dplyr)
library(stringr)

file_path <- file.choose()
BaseName <- basename(file_path)
DirName <- dirname(file_path)

file <- fread(file_path, skip = 5, col.names = c("Sample_Id","Sample_Name","Locus","Position","Genotype",
                                                 "Coverage","Major Allele Frequency","A Reads","T Reads",
                                                 "G Reads","C Reads","Positive Coverage%","QC","tmp"))
# Remove last empty collumn
file[,tmp:=NULL]


template<-read.csv("template.csv",header=T)


snp <- colnames(template)[-1]
snp <- substr(snp, 1, nchar(snp)-2)

file2 <- file[file$Locus %in% snp,c("Sample_Name","Locus","Genotype")]

online <- dcast(file2, Sample_Name ~ Locus, value.var = "Genotype")

online$rs312262906 <- "NN"

setcolorder(online, c("Sample_Name",snp))

colnames(online) <- colnames(template)

online$rs312262906_A<-gsub('C/C', '0', online$rs312262906_A)
online$rs312262906_A<-gsub('CC', '0', online$rs312262906_A)
online$rs312262906_A<-gsub('A/A', '2', online$rs312262906_A)
online$rs312262906_A<-gsub('AA', '2', online$rs312262906_A)
online$rs312262906_A<-gsub('C/A', '1', online$rs312262906_A)
online$rs312262906_A<-gsub('CA', '1', online$rs312262906_A)
online$rs312262906_A<-gsub('A/C', '1', online$rs312262906_A)
online$rs312262906_A<-gsub('AC', '1', online$rs312262906_A)
online$rs312262906_A<-gsub('C', 'NA', online$rs312262906_A)
online$rs312262906_A<-gsub('A', 'NA', online$rs312262906_A)
online$rs312262906_A<-gsub('G', 'NA', online$rs312262906_A)
online$rs312262906_A<-gsub('T', 'NA', online$rs312262906_A)
online$rs312262906_A<-gsub('./.', 'NA', online$rs312262906_A)
online$rs11547464_A<-gsub('G/G', '0', online$rs11547464_A)
online$rs11547464_A<-gsub('GG', '0', online$rs11547464_A)
online$rs11547464_A<-gsub('A/A', '2', online$rs11547464_A)
online$rs11547464_A<-gsub('AA', '2', online$rs11547464_A)
online$rs11547464_A<-gsub('G/A', '1', online$rs11547464_A)
online$rs11547464_A<-gsub('GA', '1', online$rs11547464_A)
online$rs11547464_A<-gsub('A/G', '1', online$rs11547464_A)
online$rs11547464_A<-gsub('AG', '1', online$rs11547464_A)
online$rs11547464_A<-gsub('G', 'NA', online$rs11547464_A)
online$rs11547464_A<-gsub('A', 'NA', online$rs11547464_A)
online$rs11547464_A<-gsub('C', 'NA', online$rs11547464_A)
online$rs11547464_A<-gsub('T', 'NA', online$rs11547464_A)
online$rs11547464_A<-gsub('./.', 'NA', online$rs11547464_A)
online$rs885479_T<-gsub('G/G', '0', online$rs885479_T)
online$rs885479_T<-gsub('GG', '0', online$rs885479_T)
online$rs885479_T<-gsub('A/A', '2', online$rs885479_T)
online$rs885479_T<-gsub('AA', '2', online$rs885479_T)
online$rs885479_T<-gsub('G/A', '1', online$rs885479_T)
online$rs885479_T<-gsub('GA', '1', online$rs885479_T)
online$rs885479_T<-gsub('A/G', '1', online$rs885479_T)
online$rs885479_T<-gsub('AG', '1', online$rs885479_T)
online$rs885479_T<-gsub('G', 'NA', online$rs885479_T)
online$rs885479_T<-gsub('A', 'NA', online$rs885479_T)
online$rs885479_T<-gsub('C', 'NA', online$rs885479_T)
online$rs885479_T<-gsub('T', 'NA', online$rs885479_T)
online$rs885479_T<-gsub('./.', 'NA', online$rs885479_T)
online$rs1805008_T<-gsub('C/C', '0', online$rs1805008_T)
online$rs1805008_T<-gsub('CC', '0', online$rs1805008_T)
online$rs1805008_T<-gsub('T/T', '2', online$rs1805008_T)
online$rs1805008_T<-gsub('TT', '2', online$rs1805008_T)
online$rs1805008_T<-gsub('C/T', '1', online$rs1805008_T)
online$rs1805008_T<-gsub('CT', '1', online$rs1805008_T)
online$rs1805008_T<-gsub('T/C', '1', online$rs1805008_T)
online$rs1805008_T<-gsub('TC', '1', online$rs1805008_T)
online$rs1805008_T<-gsub('C', 'NA', online$rs1805008_T)
online$rs1805008_T<-gsub('T', 'NA', online$rs1805008_T)
online$rs1805008_T<-gsub('G', 'NA', online$rs1805008_T)
online$rs1805008_T<-gsub('A', 'NA', online$rs1805008_T)
online$rs1805008_T<-gsub('./.', 'NA', online$rs1805008_T)
online$rs1805005_T<-gsub('G/G', '0', online$rs1805005_T)
online$rs1805005_T<-gsub('GG', '0', online$rs1805005_T)
online$rs1805005_T<-gsub('T/T', '2', online$rs1805005_T)
online$rs1805005_T<-gsub('TT', '2', online$rs1805005_T)
online$rs1805005_T<-gsub('G/T', '1', online$rs1805005_T)
online$rs1805005_T<-gsub('GT', '1', online$rs1805005_T)
online$rs1805005_T<-gsub('T/G', '1', online$rs1805005_T)
online$rs1805005_T<-gsub('TG', '1', online$rs1805005_T)
online$rs1805005_T<-gsub('G', 'NA', online$rs1805005_T)
online$rs1805005_T<-gsub('T', 'NA', online$rs1805005_T)
online$rs1805005_T<-gsub('C', 'NA', online$rs1805005_T)
online$rs1805005_T<-gsub('A', 'NA', online$rs1805005_T)
online$rs1805005_T<-gsub('./.', 'NA', online$rs1805005_T)
online$rs1805006_A<-gsub('C/C', '0', online$rs1805006_A)
online$rs1805006_A<-gsub('CC', '0', online$rs1805006_A)
online$rs1805006_A<-gsub('A/A', '2', online$rs1805006_A)
online$rs1805006_A<-gsub('AA', '2', online$rs1805006_A)
online$rs1805006_A<-gsub('C/A', '1', online$rs1805006_A)
online$rs1805006_A<-gsub('CA', '1', online$rs1805006_A)
online$rs1805006_A<-gsub('A/C', '1', online$rs1805006_A)
online$rs1805006_A<-gsub('AC', '1', online$rs1805006_A)
online$rs1805006_A<-gsub('C', 'NA', online$rs1805006_A)
online$rs1805006_A<-gsub('A', 'NA', online$rs1805006_A)
online$rs1805006_A<-gsub('G', 'NA', online$rs1805006_A)
online$rs1805006_A<-gsub('T', 'NA', online$rs1805006_A)
online$rs1805006_A<-gsub('./.', 'NA', online$rs1805006_A)
online$rs1805007_T<-gsub('C/C', '0', online$rs1805007_T)
online$rs1805007_T<-gsub('CC', '0', online$rs1805007_T)
online$rs1805007_T<-gsub('T/T', '2', online$rs1805007_T)
online$rs1805007_T<-gsub('TT', '2', online$rs1805007_T)
online$rs1805007_T<-gsub('C/T', '1', online$rs1805007_T)
online$rs1805007_T<-gsub('CT', '1', online$rs1805007_T)
online$rs1805007_T<-gsub('T/C', '1', online$rs1805007_T)
online$rs1805007_T<-gsub('TC', '1', online$rs1805007_T)
online$rs1805007_T<-gsub('C', 'NA', online$rs1805007_T)
online$rs1805007_T<-gsub('T', 'NA', online$rs1805007_T)
online$rs1805007_T<-gsub('G', 'NA', online$rs1805007_T)
online$rs1805007_T<-gsub('A', 'NA', online$rs1805007_T)
online$rs1805007_T<-gsub('./.', 'NA', online$rs1805007_T)
online$rs1805009_C<-gsub('G/G', '0', online$rs1805009_C)
online$rs1805009_C<-gsub('GG', '0', online$rs1805009_C)
online$rs1805009_C<-gsub('C/C', '2', online$rs1805009_C)
online$rs1805009_C<-gsub('CC', '2', online$rs1805009_C)
online$rs1805009_C<-gsub('G/C', '1', online$rs1805009_C)
online$rs1805009_C<-gsub('GC', '1', online$rs1805009_C)
online$rs1805009_C<-gsub('C/G', '1', online$rs1805009_C)
online$rs1805009_C<-gsub('CG', '1', online$rs1805009_C)
online$rs1805009_C<-gsub('G', 'NA', online$rs1805009_C)
online$rs1805009_C<-gsub('C', 'NA', online$rs1805009_C)
online$rs1805009_C<-gsub('A', 'NA', online$rs1805009_C)
online$rs1805009_C<-gsub('T', 'NA', online$rs1805009_C)
online$rs1805009_C<-gsub('./.', 'NA', online$rs1805009_C)
online$rs201326893_A<-gsub('C/C', '0', online$rs201326893_A)
online$rs201326893_A<-gsub('CC', '0', online$rs201326893_A)
online$rs201326893_A<-gsub('A/A', '2', online$rs201326893_A)
online$rs201326893_A<-gsub('AA', '2', online$rs201326893_A)
online$rs201326893_A<-gsub('C/A', '1', online$rs201326893_A)
online$rs201326893_A<-gsub('CA', '1', online$rs201326893_A)
online$rs201326893_A<-gsub('A/C', '1', online$rs201326893_A)
online$rs201326893_A<-gsub('AC', '1', online$rs201326893_A)
online$rs201326893_A<-gsub('C', 'NA', online$rs201326893_A)
online$rs201326893_A<-gsub('A', 'NA', online$rs201326893_A)
online$rs201326893_A<-gsub('G', 'NA', online$rs201326893_A)
online$rs201326893_A<-gsub('T', 'NA', online$rs201326893_A)
online$rs201326893_A<-gsub('./.', 'NA', online$rs201326893_A)
online$rs2228479_A<-gsub('G/G', '0', online$rs2228479_A)
online$rs2228479_A<-gsub('GG', '0', online$rs2228479_A)
online$rs2228479_A<-gsub('A/A', '2', online$rs2228479_A)
online$rs2228479_A<-gsub('AA', '2', online$rs2228479_A)
online$rs2228479_A<-gsub('G/A', '1', online$rs2228479_A)
online$rs2228479_A<-gsub('GA', '1', online$rs2228479_A)
online$rs2228479_A<-gsub('A/G', '1', online$rs2228479_A)
online$rs2228479_A<-gsub('AG', '1', online$rs2228479_A)
online$rs2228479_A<-gsub('G', 'NA', online$rs2228479_A)
online$rs2228479_A<-gsub('A', 'NA', online$rs2228479_A)
online$rs2228479_A<-gsub('C', 'NA', online$rs2228479_A)
online$rs2228479_A<-gsub('T', 'NA', online$rs2228479_A)
online$rs2228479_A<-gsub('./.', 'NA', online$rs2228479_A)
online$rs1110400_C<-gsub('T/T', '0', online$rs1110400_C)
online$rs1110400_C<-gsub('TT', '0', online$rs1110400_C)
online$rs1110400_C<-gsub('C/C', '2', online$rs1110400_C)
online$rs1110400_C<-gsub('CC', '2', online$rs1110400_C)
online$rs1110400_C<-gsub('T/C', '1', online$rs1110400_C)
online$rs1110400_C<-gsub('TC', '1', online$rs1110400_C)
online$rs1110400_C<-gsub('C/T', '1', online$rs1110400_C)
online$rs1110400_C<-gsub('CT', '1', online$rs1110400_C)
online$rs1110400_C<-gsub('T', 'NA', online$rs1110400_C)
online$rs1110400_C<-gsub('C', 'NA', online$rs1110400_C)
online$rs1110400_C<-gsub('A', 'NA', online$rs1110400_C)
online$rs1110400_C<-gsub('G', 'NA', online$rs1110400_C)
online$rs1110400_C<-gsub('./.', 'NA', online$rs1110400_C)
online$rs28777_C<-gsub('A/A', '0', online$rs28777_C)
online$rs28777_C<-gsub('AA', '0', online$rs28777_C)
online$rs28777_C<-gsub('C/C', '2', online$rs28777_C)
online$rs28777_C<-gsub('CC', '2', online$rs28777_C)
online$rs28777_C<-gsub('A/C', '1', online$rs28777_C)
online$rs28777_C<-gsub('AC', '1', online$rs28777_C)
online$rs28777_C<-gsub('C/A', '1', online$rs28777_C)
online$rs28777_C<-gsub('CA', '1', online$rs28777_C)
online$rs28777_C<-gsub('A', 'NA', online$rs28777_C)
online$rs28777_C<-gsub('C', 'NA', online$rs28777_C)
online$rs28777_C<-gsub('T', 'NA', online$rs28777_C)
online$rs28777_C<-gsub('G', 'NA', online$rs28777_C)
online$rs28777_C<-gsub('./.', 'NA', online$rs28777_C)
online$rs16891982_C<-gsub('G/G', '0', online$rs16891982_C)
online$rs16891982_C<-gsub('GG', '0', online$rs16891982_C)
online$rs16891982_C<-gsub('C/C', '2', online$rs16891982_C)
online$rs16891982_C<-gsub('CC', '2', online$rs16891982_C)
online$rs16891982_C<-gsub('G/C', '1', online$rs16891982_C)
online$rs16891982_C<-gsub('GC', '1', online$rs16891982_C)
online$rs16891982_C<-gsub('C/G', '1', online$rs16891982_C)
online$rs16891982_C<-gsub('CG', '1', online$rs16891982_C)
online$rs16891982_C<-gsub('G', 'NA', online$rs16891982_C)
online$rs16891982_C<-gsub('C', 'NA', online$rs16891982_C)
online$rs16891982_C<-gsub('A', 'NA', online$rs16891982_C)
online$rs16891982_C<-gsub('T', 'NA', online$rs16891982_C)
online$rs16891982_C<-gsub('./.', 'NA', online$rs16891982_C)
online$rs12821256_G<-gsub('T/T', '0', online$rs12821256_G)
online$rs12821256_G<-gsub('TT', '0', online$rs12821256_G)
online$rs12821256_G<-gsub('C/C', '2', online$rs12821256_G)
online$rs12821256_G<-gsub('CC', '2', online$rs12821256_G)
online$rs12821256_G<-gsub('T/C', '1', online$rs12821256_G)
online$rs12821256_G<-gsub('TC', '1', online$rs12821256_G)
online$rs12821256_G<-gsub('C/T', '1', online$rs12821256_G)
online$rs12821256_G<-gsub('CT', '1', online$rs12821256_G)
online$rs12821256_G<-gsub('T', 'NA', online$rs12821256_G)
online$rs12821256_G<-gsub('C', 'NA', online$rs12821256_G)
online$rs12821256_G<-gsub('A', 'NA', online$rs12821256_G)
online$rs12821256_G<-gsub('G', 'NA', online$rs12821256_G)
online$rs12821256_G<-gsub('./.', 'NA', online$rs12821256_G)
online$rs4959270_A<-gsub('C/C', '0', online$rs4959270_A)
online$rs4959270_A<-gsub('CC', '0', online$rs4959270_A)
online$rs4959270_A<-gsub('A/A', '2', online$rs4959270_A)
online$rs4959270_A<-gsub('AA', '2', online$rs4959270_A)
online$rs4959270_A<-gsub('C/A', '1', online$rs4959270_A)
online$rs4959270_A<-gsub('CA', '1', online$rs4959270_A)
online$rs4959270_A<-gsub('A/C', '1', online$rs4959270_A)
online$rs4959270_A<-gsub('AC', '1', online$rs4959270_A)
online$rs4959270_A<-gsub('C', 'NA', online$rs4959270_A)
online$rs4959270_A<-gsub('A', 'NA', online$rs4959270_A)
online$rs4959270_A<-gsub('G', 'NA', online$rs4959270_A)
online$rs4959270_A<-gsub('T', 'NA', online$rs4959270_A)
online$rs4959270_A<-gsub('./.', 'NA', online$rs4959270_A)
online$rs12203592_T<-gsub('C/C', '0', online$rs12203592_T)
online$rs12203592_T<-gsub('CC', '0', online$rs12203592_T)
online$rs12203592_T<-gsub('T/T', '2', online$rs12203592_T)
online$rs12203592_T<-gsub('TT', '2', online$rs12203592_T)
online$rs12203592_T<-gsub('C/T', '1', online$rs12203592_T)
online$rs12203592_T<-gsub('CT', '1', online$rs12203592_T)
online$rs12203592_T<-gsub('T/C', '1', online$rs12203592_T)
online$rs12203592_T<-gsub('TC', '1', online$rs12203592_T)
online$rs12203592_T<-gsub('C', 'NA', online$rs12203592_T)
online$rs12203592_T<-gsub('T', 'NA', online$rs12203592_T)
online$rs12203592_T<-gsub('G', 'NA', online$rs12203592_T)
online$rs12203592_T<-gsub('A', 'NA', online$rs12203592_T)
online$rs12203592_T<-gsub('./.', 'NA', online$rs12203592_T)
online$rs1042602_T<-gsub('C/C', '0', online$rs1042602_T)
online$rs1042602_T<-gsub('CC', '0', online$rs1042602_T)
online$rs1042602_T<-gsub('A/A', '2', online$rs1042602_T)
online$rs1042602_T<-gsub('AA', '2', online$rs1042602_T)
online$rs1042602_T<-gsub('C/A', '1', online$rs1042602_T)
online$rs1042602_T<-gsub('CA', '1', online$rs1042602_T)
online$rs1042602_T<-gsub('A/C', '1', online$rs1042602_T)
online$rs1042602_T<-gsub('AC', '1', online$rs1042602_T)
online$rs1042602_T<-gsub('C', 'NA', online$rs1042602_T)
online$rs1042602_T<-gsub('A', 'NA', online$rs1042602_T)
online$rs1042602_T<-gsub('G', 'NA', online$rs1042602_T)
online$rs1042602_T<-gsub('T', 'NA', online$rs1042602_T)
online$rs1042602_T<-gsub('./.', 'NA', online$rs1042602_T)
online$rs1800407_A<-gsub('C/C', '0', online$rs1800407_A)
online$rs1800407_A<-gsub('CC', '0', online$rs1800407_A)
online$rs1800407_A<-gsub('T/T', '2', online$rs1800407_A)
online$rs1800407_A<-gsub('TT', '2', online$rs1800407_A)
online$rs1800407_A<-gsub('C/T', '1', online$rs1800407_A)
online$rs1800407_A<-gsub('CT', '1', online$rs1800407_A)
online$rs1800407_A<-gsub('T/C', '1', online$rs1800407_A)
online$rs1800407_A<-gsub('TC', '1', online$rs1800407_A)
online$rs1800407_A<-gsub('C', 'NA', online$rs1800407_A)
online$rs1800407_A<-gsub('T', 'NA', online$rs1800407_A)
online$rs1800407_A<-gsub('G', 'NA', online$rs1800407_A)
online$rs1800407_A<-gsub('A', 'NA', online$rs1800407_A)
online$rs1800407_A<-gsub('./.', 'NA', online$rs1800407_A)
online$rs2402130_G<-gsub('A/A', '0', online$rs2402130_G)
online$rs2402130_G<-gsub('AA', '0', online$rs2402130_G)
online$rs2402130_G<-gsub('G/G', '2', online$rs2402130_G)
online$rs2402130_G<-gsub('GG', '2', online$rs2402130_G)
online$rs2402130_G<-gsub('G/A', '1', online$rs2402130_G)
online$rs2402130_G<-gsub('GA', '1', online$rs2402130_G)
online$rs2402130_G<-gsub('A/G', '1', online$rs2402130_G)
online$rs2402130_G<-gsub('AG', '1', online$rs2402130_G)
online$rs2402130_G<-gsub('A', 'NA', online$rs2402130_G)
online$rs2402130_G<-gsub('G', 'NA', online$rs2402130_G)
online$rs2402130_G<-gsub('T', 'NA', online$rs2402130_G)
online$rs2402130_G<-gsub('C', 'NA', online$rs2402130_G)
online$rs2402130_G<-gsub('./.', 'NA', online$rs2402130_G)
online$rs12913832_T<-gsub('G/G', '0', online$rs12913832_T)
online$rs12913832_T<-gsub('GG', '0', online$rs12913832_T)
online$rs12913832_T<-gsub('A/A', '2', online$rs12913832_T)
online$rs12913832_T<-gsub('AA', '2', online$rs12913832_T)
online$rs12913832_T<-gsub('G/A', '1', online$rs12913832_T)
online$rs12913832_T<-gsub('GA', '1', online$rs12913832_T)
online$rs12913832_T<-gsub('A/G', '1', online$rs12913832_T)
online$rs12913832_T<-gsub('AG', '1', online$rs12913832_T)
online$rs12913832_T<-gsub('G', 'NA', online$rs12913832_T)
online$rs12913832_T<-gsub('A', 'NA', online$rs12913832_T)
online$rs12913832_T<-gsub('C', 'NA', online$rs12913832_T)
online$rs12913832_T<-gsub('T', 'NA', online$rs12913832_T)
online$rs12913832_T<-gsub('./.', 'NA', online$rs12913832_T)
online$rs2378249_C<-gsub('A/A', '0', online$rs2378249_C)
online$rs2378249_C<-gsub('AA', '0', online$rs2378249_C)
online$rs2378249_C<-gsub('G/G', '2', online$rs2378249_C)
online$rs2378249_C<-gsub('GG', '2', online$rs2378249_C)
online$rs2378249_C<-gsub('A/G', '1', online$rs2378249_C)
online$rs2378249_C<-gsub('AG', '1', online$rs2378249_C)
online$rs2378249_C<-gsub('G/A', '1', online$rs2378249_C)
online$rs2378249_C<-gsub('GA', '1', online$rs2378249_C)
online$rs2378249_C<-gsub('A', 'NA', online$rs2378249_C)
online$rs2378249_C<-gsub('G', 'NA', online$rs2378249_C)
online$rs2378249_C<-gsub('T', 'NA', online$rs2378249_C)
online$rs2378249_C<-gsub('C', 'NA', online$rs2378249_C)
online$rs2378249_C<-gsub('./.', 'NA', online$rs2378249_C)
online$rs12896399_T<-gsub('G/G', '0', online$rs12896399_T)
online$rs12896399_T<-gsub('GG', '0', online$rs12896399_T)
online$rs12896399_T<-gsub('T/T', '2', online$rs12896399_T)
online$rs12896399_T<-gsub('TT', '2', online$rs12896399_T)
online$rs12896399_T<-gsub('G/T', '1', online$rs12896399_T)
online$rs12896399_T<-gsub('GT', '1', online$rs12896399_T)
online$rs12896399_T<-gsub('T/G', '1', online$rs12896399_T)
online$rs12896399_T<-gsub('TG', '1', online$rs12896399_T)
online$rs12896399_T<-gsub('G', 'NA', online$rs12896399_T)
online$rs12896399_T<-gsub('T', 'NA', online$rs12896399_T)
online$rs12896399_T<-gsub('C', 'NA', online$rs12896399_T)
online$rs12896399_T<-gsub('A', 'NA', online$rs12896399_T)
online$rs12896399_T<-gsub('./.', 'NA', online$rs12896399_T)
online$rs1393350_T<-gsub('G/G', '0', online$rs1393350_T)
online$rs1393350_T<-gsub('GG', '0', online$rs1393350_T)
online$rs1393350_T<-gsub('A/A', '2', online$rs1393350_T)
online$rs1393350_T<-gsub('AA', '2', online$rs1393350_T)
online$rs1393350_T<-gsub('G/A', '1', online$rs1393350_T)
online$rs1393350_T<-gsub('GA', '1', online$rs1393350_T)
online$rs1393350_T<-gsub('A/G', '1', online$rs1393350_T)
online$rs1393350_T<-gsub('AG', '1', online$rs1393350_T)
online$rs1393350_T<-gsub('G', 'NA', online$rs1393350_T)
online$rs1393350_T<-gsub('A', 'NA', online$rs1393350_T)
online$rs1393350_T<-gsub('C', 'NA', online$rs1393350_T)
online$rs1393350_T<-gsub('T', 'NA', online$rs1393350_T)
online$rs1393350_T<-gsub('./.', 'NA', online$rs1393350_T)
online$rs683_G<-gsub('A/A', '0', online$rs683_G)
online$rs683_G<-gsub('AA', '0', online$rs683_G)
online$rs683_G<-gsub('C/C', '2', online$rs683_G)
online$rs683_G<-gsub('CC', '2', online$rs683_G)
online$rs683_G<-gsub('C/A', '1', online$rs683_G)
online$rs683_G<-gsub('CA', '1', online$rs683_G)
online$rs683_G<-gsub('A/C', '1', online$rs683_G)
online$rs683_G<-gsub('AC', '1', online$rs683_G)
online$rs683_G<-gsub('A', 'NA', online$rs683_G)
online$rs683_G<-gsub('C', 'NA', online$rs683_G)
online$rs683_G<-gsub('T', 'NA', online$rs683_G)
online$rs683_G<-gsub('G', 'NA', online$rs683_G)
online$rs683_G<-gsub('./.', 'NA', online$rs683_G)
online$rs3114908_T<-gsub('C/C', '0', online$rs3114908_T)
online$rs3114908_T<-gsub('CC', '0', online$rs3114908_T)
online$rs3114908_T<-gsub('T/T', '2', online$rs3114908_T)
online$rs3114908_T<-gsub('TT', '2', online$rs3114908_T)
online$rs3114908_T<-gsub('C/T', '1', online$rs3114908_T)
online$rs3114908_T<-gsub('CT', '1', online$rs3114908_T)
online$rs3114908_T<-gsub('T/C', '1', online$rs3114908_T)
online$rs3114908_T<-gsub('TC', '1', online$rs3114908_T)
online$rs3114908_T<-gsub('C', 'NA', online$rs3114908_T)
online$rs3114908_T<-gsub('T', 'NA', online$rs3114908_T)
online$rs3114908_T<-gsub('G', 'NA', online$rs3114908_T)
online$rs3114908_T<-gsub('A', 'NA', online$rs3114908_T)
online$rs3114908_T<-gsub('./.', 'NA', online$rs3114908_T)
online$rs1800414_C<-gsub('T/T', '0', online$rs1800414_C)
online$rs1800414_C<-gsub('TT', '0', online$rs1800414_C)
online$rs1800414_C<-gsub('C/C', '2', online$rs1800414_C)
online$rs1800414_C<-gsub('CC', '2', online$rs1800414_C)
online$rs1800414_C<-gsub('T/C', '1', online$rs1800414_C)
online$rs1800414_C<-gsub('TC', '1', online$rs1800414_C)
online$rs1800414_C<-gsub('C/T', '1', online$rs1800414_C)
online$rs1800414_C<-gsub('CT', '1', online$rs1800414_C)
online$rs1800414_C<-gsub('T', 'NA', online$rs1800414_C)
online$rs1800414_C<-gsub('C', 'NA', online$rs1800414_C)
online$rs1800414_C<-gsub('A', 'NA', online$rs1800414_C)
online$rs1800414_C<-gsub('G', 'NA', online$rs1800414_C)
online$rs1800414_C<-gsub('./.', 'NA', online$rs1800414_C)
online$rs10756819_G<-gsub('A/A', '0', online$rs10756819_G)
online$rs10756819_G<-gsub('AA', '0', online$rs10756819_G)
online$rs10756819_G<-gsub('G/G', '2', online$rs10756819_G)
online$rs10756819_G<-gsub('GG', '2', online$rs10756819_G)
online$rs10756819_G<-gsub('A/G', '1', online$rs10756819_G)
online$rs10756819_G<-gsub('AG', '1', online$rs10756819_G)
online$rs10756819_G<-gsub('G/A', '1', online$rs10756819_G)
online$rs10756819_G<-gsub('GA', '1', online$rs10756819_G)
online$rs10756819_G<-gsub('A', 'NA', online$rs10756819_G)
online$rs10756819_G<-gsub('G', 'NA', online$rs10756819_G)
online$rs10756819_G<-gsub('T', 'NA', online$rs10756819_G)
online$rs10756819_G<-gsub('C', 'NA', online$rs10756819_G)
online$rs10756819_G<-gsub('./.', 'NA', online$rs10756819_G)
online$rs2238289_C<-gsub('A/A', '0', online$rs2238289_C)
online$rs2238289_C<-gsub('AA', '0', online$rs2238289_C)
online$rs2238289_C<-gsub('G/G', '2', online$rs2238289_C)
online$rs2238289_C<-gsub('GG', '2', online$rs2238289_C)
online$rs2238289_C<-gsub('A/G', '1', online$rs2238289_C)
online$rs2238289_C<-gsub('AG', '1', online$rs2238289_C)
online$rs2238289_C<-gsub('G/A', '1', online$rs2238289_C)
online$rs2238289_C<-gsub('GA', '1', online$rs2238289_C)
online$rs2238289_C<-gsub('A', 'NA', online$rs2238289_C)
online$rs2238289_C<-gsub('G', 'NA', online$rs2238289_C)
online$rs2238289_C<-gsub('T', 'NA', online$rs2238289_C)
online$rs2238289_C<-gsub('C', 'NA', online$rs2238289_C)
online$rs2238289_C<-gsub('./.', 'NA', online$rs2238289_C)
online$rs17128291_C<-gsub('A/A', '0', online$rs17128291_C)
online$rs17128291_C<-gsub('AA', '0', online$rs17128291_C)
online$rs17128291_C<-gsub('G/G', '2', online$rs17128291_C)
online$rs17128291_C<-gsub('GG', '2', online$rs17128291_C)
online$rs17128291_C<-gsub('A/G', '1', online$rs17128291_C)
online$rs17128291_C<-gsub('AG', '1', online$rs17128291_C)
online$rs17128291_C<-gsub('G/A', '1', online$rs17128291_C)
online$rs17128291_C<-gsub('GA', '1', online$rs17128291_C)
online$rs17128291_C<-gsub('A', 'NA', online$rs17128291_C)
online$rs17128291_C<-gsub('G', 'NA', online$rs17128291_C)
online$rs17128291_C<-gsub('T', 'NA', online$rs17128291_C)
online$rs17128291_C<-gsub('C', 'NA', online$rs17128291_C)
online$rs17128291_C<-gsub('./.', 'NA', online$rs17128291_C)
online$rs6497292_C<-gsub('A/A', '0', online$rs6497292_C)
online$rs6497292_C<-gsub('AA', '0', online$rs6497292_C)
online$rs6497292_C<-gsub('G/G', '2', online$rs6497292_C)
online$rs6497292_C<-gsub('GG', '2', online$rs6497292_C)
online$rs6497292_C<-gsub('A/G', '1', online$rs6497292_C)
online$rs6497292_C<-gsub('AG', '1', online$rs6497292_C)
online$rs6497292_C<-gsub('G/A', '1', online$rs6497292_C)
online$rs6497292_C<-gsub('GA', '1', online$rs6497292_C)
online$rs6497292_C<-gsub('A', 'NA', online$rs6497292_C)
online$rs6497292_C<-gsub('G', 'NA', online$rs6497292_C)
online$rs6497292_C<-gsub('T', 'NA', online$rs6497292_C)
online$rs6497292_C<-gsub('C', 'NA', online$rs6497292_C)
online$rs6497292_C<-gsub('./.', 'NA', online$rs6497292_C)
online$rs1129038_G<-gsub('T/T', '0', online$rs1129038_G)
online$rs1129038_G<-gsub('TT', '0', online$rs1129038_G)
online$rs1129038_G<-gsub('C/C', '2', online$rs1129038_G)
online$rs1129038_G<-gsub('CC', '2', online$rs1129038_G)
online$rs1129038_G<-gsub('T/C', '1', online$rs1129038_G)
online$rs1129038_G<-gsub('TC', '1', online$rs1129038_G)
online$rs1129038_G<-gsub('C/T', '1', online$rs1129038_G)
online$rs1129038_G<-gsub('CT', '1', online$rs1129038_G)
online$rs1129038_G<-gsub('T', 'NA', online$rs1129038_G)
online$rs1129038_G<-gsub('C', 'NA', online$rs1129038_G)
online$rs1129038_G<-gsub('A', 'NA', online$rs1129038_G)
online$rs1129038_G<-gsub('G', 'NA', online$rs1129038_G)
online$rs1129038_G<-gsub('./.', 'NA', online$rs1129038_G)
online$rs1667394_C<-gsub('T/T', '0', online$rs1667394_C)
online$rs1667394_C<-gsub('TT', '0', online$rs1667394_C)
online$rs1667394_C<-gsub('C/C', '2', online$rs1667394_C)
online$rs1667394_C<-gsub('CC', '2', online$rs1667394_C)
online$rs1667394_C<-gsub('T/C', '1', online$rs1667394_C)
online$rs1667394_C<-gsub('TC', '1', online$rs1667394_C)
online$rs1667394_C<-gsub('C/T', '1', online$rs1667394_C)
online$rs1667394_C<-gsub('CT', '1', online$rs1667394_C)
online$rs1667394_C<-gsub('T', 'NA', online$rs1667394_C)
online$rs1667394_C<-gsub('C', 'NA', online$rs1667394_C)
online$rs1667394_C<-gsub('A', 'NA', online$rs1667394_C)
online$rs1667394_C<-gsub('G', 'NA', online$rs1667394_C)
online$rs1667394_C<-gsub('./.', 'NA', online$rs1667394_C)
online$rs1126809_A<-gsub('G/G', '0', online$rs1126809_A)
online$rs1126809_A<-gsub('GG', '0', online$rs1126809_A)
online$rs1126809_A<-gsub('A/A', '2', online$rs1126809_A)
online$rs1126809_A<-gsub('AA', '2', online$rs1126809_A)
online$rs1126809_A<-gsub('G/A', '1', online$rs1126809_A)
online$rs1126809_A<-gsub('GA', '1', online$rs1126809_A)
online$rs1126809_A<-gsub('A/G', '1', online$rs1126809_A)
online$rs1126809_A<-gsub('AG', '1', online$rs1126809_A)
online$rs1126809_A<-gsub('G', 'NA', online$rs1126809_A)
online$rs1126809_A<-gsub('A', 'NA', online$rs1126809_A)
online$rs1126809_A<-gsub('C', 'NA', online$rs1126809_A)
online$rs1126809_A<-gsub('T', 'NA', online$rs1126809_A)
online$rs1126809_A<-gsub('./.', 'NA', online$rs1126809_A)
online$rs1470608_A<-gsub('G/G', '0', online$rs1470608_A)
online$rs1470608_A<-gsub('GG', '0', online$rs1470608_A)
online$rs1470608_A<-gsub('T/T', '2', online$rs1470608_A)
online$rs1470608_A<-gsub('TT', '2', online$rs1470608_A)
online$rs1470608_A<-gsub('G/T', '1', online$rs1470608_A)
online$rs1470608_A<-gsub('GT', '1', online$rs1470608_A)
online$rs1470608_A<-gsub('T/G', '1', online$rs1470608_A)
online$rs1470608_A<-gsub('TG', '1', online$rs1470608_A)
online$rs1470608_A<-gsub('G', 'NA', online$rs1470608_A)
online$rs1470608_A<-gsub('T', 'NA', online$rs1470608_A)
online$rs1470608_A<-gsub('C', 'NA', online$rs1470608_A)
online$rs1470608_A<-gsub('A', 'NA', online$rs1470608_A)
online$rs1470608_A<-gsub('./.', 'NA', online$rs1470608_A)
online$rs1426654_G<-gsub('A/A', '0', online$rs1426654_G)
online$rs1426654_G<-gsub('AA', '0', online$rs1426654_G)
online$rs1426654_G<-gsub('G/G', '2', online$rs1426654_G)
online$rs1426654_G<-gsub('GG', '2', online$rs1426654_G)
online$rs1426654_G<-gsub('G/A', '1', online$rs1426654_G)
online$rs1426654_G<-gsub('GA', '1', online$rs1426654_G)
online$rs1426654_G<-gsub('A/G', '1', online$rs1426654_G)
online$rs1426654_G<-gsub('AG', '1', online$rs1426654_G)
online$rs1426654_G<-gsub('A', 'NA', online$rs1426654_G)
online$rs1426654_G<-gsub('G', 'NA', online$rs1426654_G)
online$rs1426654_G<-gsub('T', 'NA', online$rs1426654_G)
online$rs1426654_G<-gsub('C', 'NA', online$rs1426654_G)
online$rs1426654_G<-gsub('./.', 'NA', online$rs1426654_G)
online$rs6119471_C<-gsub('C/C', '0', online$rs6119471_C)
online$rs6119471_C<-gsub('CC', '0', online$rs6119471_C)
online$rs6119471_C<-gsub('G/G', '2', online$rs6119471_C)
online$rs6119471_C<-gsub('GG', '2', online$rs6119471_C)
online$rs6119471_C<-gsub('C/G', '1', online$rs6119471_C)
online$rs6119471_C<-gsub('CG', '1', online$rs6119471_C)
online$rs6119471_C<-gsub('G/C', '1', online$rs6119471_C)
online$rs6119471_C<-gsub('GC', '1', online$rs6119471_C)
online$rs6119471_C<-gsub('C', 'NA', online$rs6119471_C)
online$rs6119471_C<-gsub('G', 'NA', online$rs6119471_C)
online$rs6119471_C<-gsub('A', 'NA', online$rs6119471_C)
online$rs6119471_C<-gsub('T', 'NA', online$rs6119471_C)
online$rs6119471_C<-gsub('./.', 'NA', online$rs6119471_C)
online$rs1545397_T<-gsub('A/A', '0', online$rs1545397_T)
online$rs1545397_T<-gsub('AA', '0', online$rs1545397_T)
online$rs1545397_T<-gsub('T/T', '2', online$rs1545397_T)
online$rs1545397_T<-gsub('TT', '2', online$rs1545397_T)
online$rs1545397_T<-gsub('A/T', '1', online$rs1545397_T)
online$rs1545397_T<-gsub('AT', '1', online$rs1545397_T)
online$rs1545397_T<-gsub('T/A', '1', online$rs1545397_T)
online$rs1545397_T<-gsub('TA', '1', online$rs1545397_T)
online$rs1545397_T<-gsub('A', 'NA', online$rs1545397_T)
online$rs1545397_T<-gsub('T', 'NA', online$rs1545397_T)
online$rs1545397_T<-gsub('C', 'NA', online$rs1545397_T)
online$rs1545397_T<-gsub('G', 'NA', online$rs1545397_T)
online$rs1545397_T<-gsub('./.', 'NA', online$rs1545397_T)
online$rs6059655_T<-gsub('G/G', '0', online$rs6059655_T)
online$rs6059655_T<-gsub('GG', '0', online$rs6059655_T)
online$rs6059655_T<-gsub('A/A', '2', online$rs6059655_T)
online$rs6059655_T<-gsub('AA', '2', online$rs6059655_T)
online$rs6059655_T<-gsub('G/A', '1', online$rs6059655_T)
online$rs6059655_T<-gsub('GA', '1', online$rs6059655_T)
online$rs6059655_T<-gsub('A/G', '1', online$rs6059655_T)
online$rs6059655_T<-gsub('AG', '1', online$rs6059655_T)
online$rs6059655_T<-gsub('G', 'NA', online$rs6059655_T)
online$rs6059655_T<-gsub('A', 'NA', online$rs6059655_T)
online$rs6059655_T<-gsub('C', 'NA', online$rs6059655_T)
online$rs6059655_T<-gsub('T', 'NA', online$rs6059655_T)
online$rs6059655_T<-gsub('./.', 'NA', online$rs6059655_T)
online$rs12441727_A<-gsub('G/G', '0', online$rs12441727_A)
online$rs12441727_A<-gsub('GG', '0', online$rs12441727_A)
online$rs12441727_A<-gsub('A/A', '2', online$rs12441727_A)
online$rs12441727_A<-gsub('AA', '2', online$rs12441727_A)
online$rs12441727_A<-gsub('G/A', '1', online$rs12441727_A)
online$rs12441727_A<-gsub('GA', '1', online$rs12441727_A)
online$rs12441727_A<-gsub('A/G', '1', online$rs12441727_A)
online$rs12441727_A<-gsub('AG', '1', online$rs12441727_A)
online$rs12441727_A<-gsub('G', 'NA', online$rs12441727_A)
online$rs12441727_A<-gsub('A', 'NA', online$rs12441727_A)
online$rs12441727_A<-gsub('C', 'NA', online$rs12441727_A)
online$rs12441727_A<-gsub('T', 'NA', online$rs12441727_A)
online$rs12441727_A<-gsub('./.', 'NA', online$rs12441727_A)
online$rs3212355_A<-gsub('C/C', '0', online$rs3212355_A)
online$rs3212355_A<-gsub('CC', '0', online$rs3212355_A)
online$rs3212355_A<-gsub('T/T', '2', online$rs3212355_A)
online$rs3212355_A<-gsub('TT', '2', online$rs3212355_A)
online$rs3212355_A<-gsub('C/T', '1', online$rs3212355_A)
online$rs3212355_A<-gsub('CT', '1', online$rs3212355_A)
online$rs3212355_A<-gsub('T/C', '1', online$rs3212355_A)
online$rs3212355_A<-gsub('TC', '1', online$rs3212355_A)
online$rs3212355_A<-gsub('C', 'NA', online$rs3212355_A)
online$rs3212355_A<-gsub('T', 'NA', online$rs3212355_A)
online$rs3212355_A<-gsub('G', 'NA', online$rs3212355_A)
online$rs3212355_A<-gsub('A', 'NA', online$rs3212355_A)
online$rs3212355_A<-gsub('./.', 'NA', online$rs3212355_A)
online$rs8051733_C<-gsub('A/A', '0', online$rs8051733_C)
online$rs8051733_C<-gsub('AA', '0', online$rs8051733_C)
online$rs8051733_C<-gsub('G/G', '2', online$rs8051733_C)
online$rs8051733_C<-gsub('GG', '2', online$rs8051733_C)
online$rs8051733_C<-gsub('G/A', '1', online$rs8051733_C)
online$rs8051733_C<-gsub('GA', '1', online$rs8051733_C)
online$rs8051733_C<-gsub('A/G', '1', online$rs8051733_C)
online$rs8051733_C<-gsub('AG', '1', online$rs8051733_C)
online$rs8051733_C<-gsub('A', 'NA', online$rs8051733_C)
online$rs8051733_C<-gsub('G', 'NA', online$rs8051733_C)
online$rs8051733_C<-gsub('T', 'NA', online$rs8051733_C)
online$rs8051733_C<-gsub('C', 'NA', online$rs8051733_C)
online$rs8051733_C<-gsub('./.', 'NA', online$rs8051733_C)

online <- online[ , lapply(.SD, function(x) gsub("NN", "NA", x))]

BName <- gsub(".csv", "", BaseName)

dir.create(BName)

for(i in 1:nrow(online)){
  write.table(online[i,], file=paste0(DirName, "/", BName, "/", gsub(".csv", "", BaseName), "_", online$sampleid[i], "_Out.csv"), row.names=FALSE, sep=",")
}
    
    