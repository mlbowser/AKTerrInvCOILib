## R script to select representatives with verbatim matching sequences, choosing those having the best identifications and associated data.

wd <- "/home/mattbowser/AK_arhropod_COI_library"
setwd(wd)

de1 <- read.delim("2019-03-22-1439_derep.txt", header=FALSE)

de2 <- de1[, 9:10]
names(de2) <- c("Query", "Target")
sl <- grepl("\\*", de2$Target)
de2$Query <- as.character(de2$Query)
de2$Target <- as.character(de2$Target)
de2$Target[sl] <- de2$Query[sl]
de2 <- unique(de2)

ak <- read.delim("Alaska.txt", quote="", stringsAsFactors = FALSE)
bc <- read.delim("British_Columbia.txt", quote="", stringsAsFactors = FALSE)
yk <- read.delim("Yukon_Territory.txt", quote="", stringsAsFactors = FALSE)
ru <- read.delim("Russia.txt", quote="", stringsAsFactors = FALSE)

d1 <- rbind(ak, bc, yk, ru)

tg <- levels(as.factor(de2$Target))

## Now for each target I want to select one of the records with the most complete data.
## First make a dataframe to put results in.
Target <- tg
rdf <- as.data.frame(tg)
rdf$rep <- NA ## for selected representative sequence records.

for (this_tg in 1:length(tg))
 {
 
 ## First make dataframe of records with matching sequences.
 ttg <- tg[this_tg]
 qr <- de2$Query[which(de2$Target == ttg)] 
 sl <- which(d1$processid %in% qr)
 qdf <- d1[sl,]
 qdf$lt <- paste(qdf$class_name, qdf$order_name, qdf$family_name, qdf$species_name)
 
 ## If there are any species identifications, choose these.
 if (sum(is.na(qdf$species_name)) > 0)
  {
  sl <- !(is.na(qdf$species_name))
  qdf <- qdf[sl,]
  } 
 
 ## If there are no species IDs just pick the longest taxonomy.
 if (sum(!is.na(qdf$species_name)) == 0) 
  {
  mxlt <- max(nchar(qdf$lt))
  sl <- nchar(qdf$lt) == mxlt
  qdf <- qdf[sl,]
  }
 
 ## If some have BINs and some don't, choose the ones with BINS.
 if (sum(is.na(qdf$bin_uri)) > 0)
  {
  sl <- !(is.na(qdf$bin_uri))
  qdf <- qdf[sl,]
  }
  
 ## Now if some records are from Alaska, choose these.
  if (sum(qdf$province_state %in% "Alaska") > 0)
  {
  sl <- qdf$province_state %in% "Alaska"
  qdf <- qdf[sl,]
  }
 
 ## Now just make a random choice.
 sl <- sample(qdf$processid, size=1)
 
 ## Now populate that dataframe.
 rdf$rep[this_tg] <- sl
 
 } ## This loop takes forever. How could I make it faster?

write.csv(rdf, "selected_records.csv", row.names=FALSE)
