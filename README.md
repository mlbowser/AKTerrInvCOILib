# AKTerrInvCOILib: Alaska terrestrial arthropod DNA barcode COI reference library
This is a COI DNA barcode library for use in metagenomic analyses of terrestrial arthropods in the vicinity of Alaska.
## Methods
Publicly available DNA barcode sequences and corresponding specimen data of arthropods from Alaska, Yukon Territory, British Columbia, and Russia were downloaded from BOLD (<http://www.boldsystems.org/>) on March 15, 2019, yielding 415,779 records.  Search strings and numbers of records obtained are included below.

| Search String                             | Records |
| ----------------------------------------- | -------:|
| "Arthropoda"[tax] "Alaska"[geo]           |  10,227 |
| "Arthropoda"[tax] "British Columbia"[geo] | 306,010 |
| "Arthropoda"[tax] "Russia"[geo]           |  22,032 |
| "Arthropoda"[tax] "Yukon Territory"[geo]  |  77,510 |

The library was first dereplicated using VSEARCH (<https://doi.org/10.5281/zenodo.15524>).  From among each set of replicate sequences, an R script was used to select records having the most useful specimen data.  First, if any of a set of replicate sequences had species-resolution identifications, these were selected.  If none had species-resolution identifications, then the record(s) having the most complete taxonomy were selected.  Next, if some records had BOLD BIN (<https://doi.org/10.1371/journal.pone.0066213>) assignments while others did not, those having BIN assignments were chosen.  Records from Alaska were chosen over records from other regions.  Finally, if more than one record met all of these criteria, one record was randomly chosen using the `sample` function of R.  Finally, the dereplicated sequences were clustered using VSEARCH with options `--cluster_fast --iddef 0 --id 0.99`, yielding a reference library of 140,244 sequences.

## Files

**2019-03-25-0832_clusters.fas.gz**

Representative sequences with BOLD processids as identifiers in compressed FASTA format.  

**2019-03-25-0832_clusters.qza**

Representative sequences with BOLD processids as identifiers as a QIIME 2 artifact.

**2019-03-25-0828_tax.txt**

Taxonomy of representative sequences in HeaderlessTSVTaxonomyFormat as a text file.

**2019-03-25-0828_tax.qza**

Taxonomy of representative sequences as a QIIME 2 artifact.

**2019-04-19-1122_specimen_data.txt.gz**

Specimen data of representative sequences in BOLD's txt export format.

The **scripts** folder contains scripts and commands used to create the library.  These are messy, showing the actual workflow.
