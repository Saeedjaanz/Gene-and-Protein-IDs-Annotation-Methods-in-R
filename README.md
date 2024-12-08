# Gene and Protein IDs Annotation Methods in R

This repository contains methods to annotate gene and protein IDs in R using various libraries and packages. 
Follow the instructions provided to set up your environment and annotate gene or protein IDs efficiently.

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
