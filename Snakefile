import os
import platform
from os.path import join
import pandas as pd

# Directory / file constants
SRC_DIR = "src"
DATA_DIR = "data"
RAW_DIR = join(DATA_DIR, "raw")
PROCESSED_DIR = join(DATA_DIR, "processed")

FIJI_CMD = "java -jar -Xmx4096m /Applications/Fiji.app/jars/ij-1.53c.jar -ijpath /Applications/Fiji.app/ -batch"
BFCONVERT_CMD = "~/software/bftools/bfconvert"
TIFFCOMMENT_CMD = "~/software/bftools/tiffcomment"

rule all:
  input:
    join(PROCESSED_DIR, "vectra_breast_cancer_xyzct.ome.tif"),
    join(PROCESSED_DIR, "vectra_breast_cancer_feature_0.ome.tif"),
    join(PROCESSED_DIR, "vectra_breast_cancer_feature_1.ome.tif")

rule convert_to_ome_tiff:
  input:
    join(RAW_DIR, "vectra_breast_cancer_xyzct.tif")
  output:
    img=join(PROCESSED_DIR, "vectra_breast_cancer_xyzct.ome.tif"),
    in_xml=join(RAW_DIR, "vectra_breast_cancer.in.ome.xml"),
    out_xml=join(RAW_DIR, "vectra_breast_cancer.out.ome.xml")
  params:
    script=join(SRC_DIR, "add_channel_names.py"),
  shell:
    """
    {BFCONVERT_CMD} -tilex 512 -tiley 512 -pyramid-resolutions 6 -pyramid-scale 2  -compression LZW {input} {output.img} \
    && {TIFFCOMMENT_CMD} {output.img} > {output.in_xml} \
    && python {params.script} -i {output.in_xml} -o {output.out_xml} \
    && {TIFFCOMMENT_CMD} -set '{output.out_xml}' {output.img}
    """

rule stack:
  input:
    join(RAW_DIR, "vectra_breast_cancer.tif")
  output:
    join(RAW_DIR, "vectra_breast_cancer_xyzct.tif")
  shell:
    """
    {FIJI_CMD} ./src/t_to_c.js
    """