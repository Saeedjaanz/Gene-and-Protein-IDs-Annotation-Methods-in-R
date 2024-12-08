# Method 3: Annotation using EnsDb.Hsapiens.v86

# Un-comment these lines to install required packages
# if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager")
# BiocManager::install("EnsDb.Hsapiens.v86")
# BiocManager::install("AnnotationDbi")
# install.packages("openxlsx")

library(EnsDb.Hsapiens.v86)
library(AnnotationDbi)
library(openxlsx)

# Annotate Gene IDs
annotated_ids3 <- mapIds(EnsDb.Hsapiens.v86,
                         keys = gene_IDs$Gene.Ids, # Ensure gene_IDs is loaded
                         keytype = "SYMBOL",
                         column = "GENEID")

# Save annotated IDs to an Excel file
annotated_ids3 <- data.frame(annotated_ids3)
colnames(annotated_ids3) <- "ENSEMBL_IDs" # Renaming the column
openxlsx::write.xlsx(annotated_ids3, "../Documents/annotated_ids3.xlsx", colnames = TRUE)