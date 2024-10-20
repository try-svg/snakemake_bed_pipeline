# Snakemake BED File Sorting Pipeline

## Overview

This pipeline processes multiple BED files for a sample, selects lines based on specified chromosomes, sorts them, and merges the results into a final compressed output.

## Usage

### Prerequisites

- Conda installed
- Snakemake installed (`conda install -c conda-forge snakemake`)
- Git installed

### Steps to Run

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd snakemake_bed_pipeline
   ```

2.Create and activate the Conda environment:
conda create -n snakemake_env python=3.8 snakemake pandas -y
conda activate snakemake_env

3.Run the pipeline:
snakemake --cores 4

Output
The final sorted BED file will be available in the sample_based_sorted/ directory.

File Structure
data/: Contains input BED files and metadata.
metadata/: Contains chromosome selection file.
scripts/: Contains the Python script for splitting by chromosome.
Snakefile: Defines the Snakemake pipeline.
