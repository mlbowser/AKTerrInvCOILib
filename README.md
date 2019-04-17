# AKTerrInvCOILib
This is a COI DNA barcode library for use in metagenomic analyses of terrestrial arthropods in the vicinity of Alaska.

Publicly available DNA barcode sequences and corresponding specimen data of arthropods from Alaska, Yukon Territory, British Columbia, and Russa were downloaded from BOLD (http://www.boldsystems.org/) on March 15, 2019, yielding 415,779 records.  Search strings and numbers of records obtained are included below.

Search String                             Records
"Arthropoda"[tax] "Alaska"[geo]            10,227
"Arthropoda"[tax] "British Columbia"[geo] 306,010
"Arthropoda"[tax] "Russia"[geo]            22,032
"Arthropoda"[tax] "Yukon Territory"[geo]   77,510

The library was first dereplicated using VSEARCH.  From among each set of replicate sequences, we used an R script to select records having the most useful specimen data.  First, if any of a set of replicate sequences had species-resolution identifications, these were selected.  If none had species-reloution identifications, then the record(s) having the most complete taxonomy were selected.  Next, if some records had BOLD BIN assignments while others did not, those having BIN assignments were chosen.  Records from Alaska were chosen over records from other regions.  Finally, if more than one record met all of these criteria, one record was randomly chosen using the sample function of R.  Finally, the dereplicated sequences were clustered using VSEARCH with options "--cluster_fast with options --iddef 0 --id 0.99", yielding a referece library of 140,244 sequences.
