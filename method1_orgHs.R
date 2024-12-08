# Method 1: Annotation using org.Hs.eg.db

# Un-comment these lines to install required packages
# if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager")
# BiocManager::install("org.Hs.eg.db")
# BiocManager::install("clusterProfiler")
# install.packages("readxl")
# install.packages("openxlsx")

library(org.Hs.eg.db)
library(clusterProfiler)
library(readxl)
library(openxlsx)

# Load data from Excel
data <- read_excel("../Documents/Gene IDs.xlsx") # Update file path as needed
genes <- data$'Gene Ids'

# Check supported identifiers
keytypes <- keytypes(org.Hs.eg.db)
print(keytypes)

# Annotation: Mapping Gene Symbols to ENSEMBL IDs
annotated_ids1 <- bitr(genes, fromType = "SYMBOL", toType = "ENSEMBL", OrgDb = org.Hs.eg.db)
View(annotated_ids1)

# Save annotated IDs to an Excel file
openxlsx::write.xlsx(annotated_ids1, "../Documents/annotated_ids1.xlsx", colnames = TRUE)
