dataDir = "/Users/mkeller/research/dbmi/vitessce/mesmer/data/raw"

stains = IJ.openImage(dataDir + "/vectra_breast_cancer.tif");

imp = HyperStackConverter.toHyperStack(stains, 2, 1, 1, "xyzct", "Grayscale");

IJ.saveAs(imp, "Tiff", dataDir + "/vectra_breast_cancer_xyzct.tif");