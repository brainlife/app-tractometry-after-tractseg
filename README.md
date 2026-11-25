[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.708-blue.svg)](https://doi.org/10.25663/brainlife.app.708)

# app-tractometry-after-tractseg

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

**Computes tract profiles of FA, MD, RD and AD along each TractSeg tract with TractSeg 2.7 Tractometry, and outputs one tractmeasures CSV per tensor measure.**

Runs TractSeg's Tractometry on the TractSeg TOM trackings and endings segmentations, sampling each tensor map along every tract. Use it after TractSeg to obtain along-tract microstructure profiles for group analyses. Needs a TractSeg output (with TOM_trackings and endings_segmentations) and tensor maps in the same space.

Run it on brainlife.io: [https://doi.org/10.25663/brainlife.app.708](https://doi.org/10.25663/brainlife.app.708)

| Input | Datatype | Required | Description |
|---|---|---|---|
| `tractseg` | `neuro/tractseg` | yes | TractSeg output |
| `tensor` | `neuro/tensor` | yes | Tensor, which should be in the same space as the tractseg output. Tractometry is run over FA, MD, RD, and AD. |

| Output | Datatype | Description |
|---|---|---|
| `tractseg_tractometry_fa` | `neuro/tractmeasures` | Tractometry over FA |
| `tractseg_tractometry_md` | `neuro/tractmeasures` | Tractometry over MD |
| `tractseg_tractometry_rd` | `neuro/tractmeasures` | Tractometry over RD |
| `tractseg_tractometry_ad` | `neuro/tractmeasures` | Tractometry over AD |

Runtime: container `brainlife/tractseg:2.7`; 4 CPUs; 0.5 h walltime.

Please cite:
- Wasserthal J., Neher P., Maier-Hein K.H. TractSeg - Fast and accurate white matter tract segmentation. NeuroImage 183:239-253 (2018). [doi:10.1016/j.neuroimage.2018.07.070](https://doi.org/10.1016/j.neuroimage.2018.07.070)
- Avesani P. et al. The open diffusion data derivatives. Sci Data 6, 69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

<!-- brainlife-app:end -->

This App computes tractometry on the TractSeg output. For each tract available from the segmentation, the App computes the tract profile using 
the values of the tensor, specifically FA, MD, RD, and AD.

### Authors
- Giulia Berto

### Funding Acknowledgement
brainlife.io is publicly funded and for the sustainability of the project it is helpful to Acknowledge the use of the platform. We kindly ask that you acknowledge the funding below in your publications and code reusing this code.

[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-ACI-1916518](https://img.shields.io/badge/NSF_ACI-1916518-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1916518)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://grantome.com/grant/NIH/R01-EB029272-01)

### Citations
We kindly ask that you cite the following articles when publishing papers and code using this code. 

1. Wasserthal, J., Neher, P., & Maier-Hein, K. H. (2018). TractSeg-Fast and accurate white matter tract segmentation. NeuroImage, 183, 239-253. [https://doi.org/10.1016/j.neuroimage.2018.07.070](https://doi.org/10.1016/j.neuroimage.2018.07.070)

2. Avesani, P., McPherson, B., Hayashi, S. et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. Sci Data 6, 69 (2019). [https://doi.org/10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

#### MIT Copyright (c) 2022 brainlife.io The University of Texas at Austin


## Running the App 

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/bl.app.708](https://doi.org/10.25663/bl.app.708) via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
    "endings_segmentations": "./input/endings_segmentations",
    "TOM_trackings": "./input/TOM_trackings",
    "fa": "./input/fa.nii.gz",
    "md": "./input/md.nii.gz",
    "rd": "./input/rd.nii.gz",
    "ad": "./input/ad.nii.gz",
}
```

3. Launch the App by executing `main`

```bash
./main
```

## Input

* tractseg output
* tensor folder, containing the following images: fa.nii.gz, md.nii.gz, rd.nii.gz, and ad.nii.gz

## Output

* 4 .csv files with tractometry results, one per each tensor image

### Dependencies

This App only requires [singularity](https://www.sylabs.io/singularity/) to run.

#### MIT Copyright (c) 2022 brainlife.io The University of Texas at Austin
