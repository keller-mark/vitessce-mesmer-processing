Download data from https://deepcell.org/predict and put in new folder `data/raw`:

```
data
  -> raw
    -> vectra_breast_cancer.tif
       vectra_breast_cancer_feature_0.tif
       vectra_breast_cancer_feature_1.tif
```

Create and activate the Python environment using `conda`:

```sh
conda env create -f environment.yml
conda activate vitessce-mesmer-processing
```

Update paths to software: https://github.com/keller-mark/vitessce-mesmer-processing/blob/main/Snakefile#L12
- FIJI
- bioformats tools

Update path to data directory: https://github.com/keller-mark/vitessce-mesmer-processing/blob/main/src/t_to_c.js#L1


Process the images for visualization:

```sh
snakemake -j 1
```

Run the jupyter notebook for visualization:

```sh
jupyter lab
```
