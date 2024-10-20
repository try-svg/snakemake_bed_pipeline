import sys
from collections import defaultdict

selected_chrom = sys.argv[1].split(",")
sample_id = sys.argv[2]
fp_dict = {}

for i in selected_chrom:
    fp_dict[i] = open("splitted/" + sample_id + "_chrom_" + i + ".bed", "w")

for line in sys.stdin:
    l_items = line.strip().split("\t")
    if l_items[0] in fp_dict:
        fp_dict[l_items[0]].write(line)

for i in selected_chrom:
    fp_dict[i].close()
