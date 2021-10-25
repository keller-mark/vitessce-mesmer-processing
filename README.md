Download data from https://deepcell.org/predict and put in new folder `data/raw`:

```
data
  -> raw
    -> vectra_breast_cancer.tif
       vectra_breast_cancer_feature_0.tif
       vectra_breast_cancer_feature_1.tif

Create and activate the Python environment using `conda`:

```sh
conda env create -f environment.yml
conda activate vitessce-mesmer-processing
```

Process the images for visualization:

```sh
snakemake -j 1
```

Run the jupyter notebook for visualization:

```sh
jupyter lab
```
