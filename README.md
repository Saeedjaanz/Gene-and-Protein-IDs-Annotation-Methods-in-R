# Gene and Protein IDs Annotation Methods in R

This repository provides R code for annotating gene and protein IDs using different methods. The methods include the use of the `org.Hs.eg.db` package, `biomaRt` package, and `EnsDb.Hsapiens.v86` database.

## Methods Overview

### Method 1: Annotation Using `org.Hs.eg.db`
This method uses the `org.Hs.eg.db` package for gene annotation.

### Method 2: Annotation Using `biomaRt`
This method utilizes the `biomaRt` package to annotate gene IDs from Ensembl.

### Method 3: Annotation Using `EnsDb.Hsapiens.v86`
This method makes use of the `EnsDb.Hsapiens.v86` package for gene ID annotation.

## View Detailed Code and Console Output

For the full R code, including console output and generated results, please visit the following [RP ubs publication](https://rpubs.com/Saeedjaanz/genes_or_proteins_ids_annotation_methods_in_R).

---

## Files in the Repository

- `method1_code.R`: Code for Method 1 (using `org.Hs.eg.db`)
- `method2_code.R`: Code for Method 2 (using `biomaRt`)
- `method3_code.R`: Code for Method 3 (using `EnsDb.Hsapiens.v86`)
- `example_data.xlsx`: Example dataset for testing the methods

---

## How to Run the Code

1. Install the required R packages:
    - `org.Hs.eg.db`
    - `biomaRt`
    - `EnsDb.Hsapiens.v86`
    - `openxlsx`
    - `clusterProfiler`
    - `readxl`

2. Run the code in the corresponding `.R` files for each method.

3. View the annotated gene IDs in the output Excel files.

---

## License

This project is free for everyone to use.


---

## Repository Structure

---

## Methods Overview

### **Method 1: Annotation Using `org.Hs.eg.db`**
This method uses the `org.Hs.eg.db` package and `clusterProfiler` to map gene symbols to ENSEMBL IDs.  
**File**: [method1_orgHs.R](method1_orgHs.R)

#### **Key Features**:
- Uses `org.Hs.eg.db` for human genome data.
- Converts gene symbols to ENSEMBL IDs.
- Saves results in an Excel file.

---

### **Method 2: Annotation Using `biomaRt`**
This method uses the `biomaRt` package to annotate thousands of gene symbols in a batch.  
**File**: [method2_biomart.R](method2_biomart.R)

#### **Key Features**:
- Connects to Ensembl's biomaRt database.
- Retrieves multiple attributes such as ENSEMBL IDs and gene descriptions.
- Saves results in an Excel file.

---

### **Method 3: Annotation Using `EnsDb.Hsapiens.v86`**
This method uses the `EnsDb.Hsapiens.v86` package, a preloaded annotation database, and `AnnotationDbi`.  
**File**: [method3_EnsDb.R](method3_EnsDb.R)

#### **Key Features**:
- No external connections are required; it works offline.
- Maps gene symbols to ENSEMBL GENE IDs.
- Saves results in an Excel file.

---

## How to Use

### 1. Prerequisites
- Install R and RStudio.
- Install the required libraries:
  ```r
  if (!require("BiocManager")) install.packages("BiocManager")
  BiocManager::install(c("org.Hs.eg.db", "biomaRt", "EnsDb.Hsapiens.v86", "AnnotationDbi", "clusterProfiler"))
  install.packages(c("readxl", "openxlsx"))

---

### **2. R Script Files**

#### **method1_orgHs.R**
```r
# Method 1: Annotation using org.Hs.eg.db
library(org.Hs.eg.db)
library(clusterProfiler)
library(readxl)
library(openxlsx)

# Load data
data <- read_excel("example_data.xlsx")
genes <- data$Gene_Symbols

# Annotation
annotated_ids1 <- bitr(genes, fromType = "SYMBOL", toType = "ENSEMBL", OrgDb = org.Hs.eg.db)
openxlsx::write.xlsx(annotated_ids1, "annotated_ids1.xlsx", colNames = TRUE)

# Method 2: Annotation using biomaRt
library(biomaRt)
library(openxlsx)

# Load data
data <- read_excel("example_data.xlsx")
genes <- data$Gene_Symbols

# Connect to Ensembl
ensembl_conn <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")
annotated_ids2 <- getBM(attributes = c("uniprot_gn_symbol", "ensembl_gene_id"),
                        filters = "uniprot_gn_symbol",
                        values = genes,
                        mart = ensembl_conn)
openxlsx::write.xlsx(annotated_ids2, "annotated_ids2.xlsx", colNames = TRUE)

# Method 3: Annotation using EnsDb.Hsapiens.v86
library(EnsDb.Hsapiens.v86)
library(AnnotationDbi)
library(openxlsx)

# Load data
data <- read_excel("example_data.xlsx")
genes <- data$Gene_Symbols

# Annotation
annotated_ids3 <- mapIds(EnsDb.Hsapiens.v86, keys = genes, keytype = "SYMBOL", column = "GENEID")
annotated_ids3 <- data.frame(ENSEMBL_IDs = annotated_ids3)
openxlsx::write.xlsx(annotated_ids3, "annotated_ids3.xlsx", colNames = TRUE)
```
---
## Conclusion

Thank you for exploring the Gene and Protein ID Annotation methods. The methods provided here demonstrate different approaches for annotating gene identifiers using popular R packages. For more details, including the full code and console output, visit the RPubs publication.

Feel free to clone this repository, experiment with the code, and adapt it for your own research needs. If you encounter any issues or have suggestions for improvement, please open an issue or submit a pull request.

Happy coding and research!
