## Today I want to export data in TSV format similar to BOLD downloads.
wd <- "C:/Users/mattbowser/Documents/2017_STDP_NGS/work_space/2019-03-15_library_construction"
setwd(wd)
load("2019-03-25-0830_workspace.RData")

write.table(d2[,1:68],
 file = "2019-04-19-1122_specimen_data.txt",
 append = FALSE,
 quote = FALSE,
 sep = "\t",
 #eol = "\n",
 na = "",
 dec = ".",
 row.names = FALSE,
 col.names = TRUE
 )
