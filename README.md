
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