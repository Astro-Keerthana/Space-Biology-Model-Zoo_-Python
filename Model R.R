# Install the edgeR package from Bioconductor
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("edgeR")
install.packages("dplyr")
install.packages("biomaRT")
install.packages("stats")
install.packages("caret")
install.packages("plotly")

# Load necessary packages
library(DESeq2)       # For differential expression analysis
library(ggplot2)      # For data visualization
library(edgeR)   
library(dplyr)
library(biomaRt)
library(stats)
library(caret)
library(plotly)
library(recount3)

# Alternative for differential expression analysis
# Load other required packages as needed

# Set your working directory to where your data is located
setwd("/path/to/your/data")

# Read in your data (replace with actual file paths)
# Example: Read in count data
count_data <- read.table("count_data.txt", header = TRUE, sep = "\t")

# Read in your sample information (metadata)
# Example: Read in a metadata file
sample_info <- read.table("sample_info.txt", header = TRUE, sep = "\t")
file_path <- file.choose()
sample_info <- read.table(file_path, header = TRUE, sep = "\t")

# Create a DESeq2 or edgeR object
# DESeq2 Example:
dim(count_data)
dim(sample_info)

if (ncol(count_data) != nrow(sample_info)) {
  stop("Dimensions of count_data and sample_info do not match.")
}

colnames(count_data)
rownames(sample_info)

head(sample_info)
dds <- DESeqDataSetFromMatrix(countData = count_data, colData = sample_info, design = ~ condition)

# edgeR Example:
# dge <- DGEList(counts = count_data, group = sample_info$condition)

# Perform differential expression analysis
# DESeq2 Example:
dds <- DESeq(dds)
res <- results(dds)


# Visualize the results (modify as needed)
# Example: MA plot
plotMA(res)


# Save the results
# Example: Save differential expression results to a CSV file
write.csv(as.data.frame(res), "differential_expression_results.csv")
