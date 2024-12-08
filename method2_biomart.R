# Method 2: Annotation using biomaRt

# Un-comment these lines to install required packages
# if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager")
# BiocManager::install("biomaRt")
# install.packages("openxlsx")

library(biomaRt)
library(openxlsx)

# Load data from CSV
gene_IDs <- read.csv("../Documents/Gene IDs.csv", header = TRUE) # Update file path as needed

# Connect to Ensembl and retrieve attributes
ensembl_conn <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")
annotated_ids2 <- getBM(attributes = c("uniprot_gn_symbol", "ensembl_gene_id"),
                        filters = "uniprot_gn_symbol",
                        values = gene_IDs$Gene.Ids,
                        mart = ensembl_conn)

# Save annotated IDs to an Excel file
openxlsx::write.xlsx(annotated_ids2, "../Documents/annotated_ids2.xlsx", colnames = TRUE)
