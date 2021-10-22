```sh
# Convert Tiff to OME-Tiff
~/software/bftools/bfconvert  -tilex 512 -tiley 512 -pyramid-resolutions 6 -pyramid-scale 2  -compression LZW data/raw/vectra_breast_cancer.tif data/processed/vectra_breast_cancer.ome.tif

~/software/bftools/bfconvert  -tilex 512 -tiley 512 -pyramid-resolutions 6 -pyramid-scale 2  -compression LZW data/raw/vectra_breast_cancer_feature_0.tif data/processed/vectra_breast_cancer_feature_0.ome.tif

~/software/bftools/bfconvert  -tilex 512 -tiley 512 -pyramid-resolutions 6 -pyramid-scale 2  -compression LZW data/raw/vectra_breast_cancer_feature_1.tif data/processed/vectra_breast_cancer_feature_1.ome.tif
```