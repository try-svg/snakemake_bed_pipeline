# Minimal Snakefile
SAMPLES = ["sample1"]  # Replace with your actual sample names
CHROMS = ["chr1", "chr2"]  # Replace with your actual chromosomes

rule all:
    input:
        expand("sample_based_sorted/{sample}.bed.gz", sample=SAMPLES)

rule split:
    input:
        "data/shufa.bed"
    output:
        "splitted/{sample}_chrom_{chrom}.bed"
    shell:
        "python scripts/split_by_chromosome.py {input} {wildcards.chrom} {wildcards.sample} > {output}"

rule sort:
    input:
        "splitted/{sample}_chrom_{chrom}.bed"
    output:
        "sorted_by_chrom/{sample}_chrom_{chrom}.bed"
    shell:
        "sort -S4G --parallel=4 -k2,2n -k3,3n {input} > {output}"

rule merge:
    input:
        expand("sorted_by_chrom/{{sample}}_chrom_{chrom}.bed", chrom=CHROMS)
    output:
        "sample_based_sorted/{sample}.bed.gz"
    shell:
        "cat {input} | gzip > {output}"