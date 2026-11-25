<h1 align="center">Tractometry over tensor</h1>

<p align="center">
  FA, MD, RD and AD tract profiles for every TractSeg tract, with TractSeg Tractometry.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.708"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.708-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Computes tract profiles of FA, MD, RD and AD along each TractSeg tract with TractSeg 2.7 Tractometry, and outputs one tractmeasures CSV per tensor measure.**

Runs TractSeg's Tractometry on the TractSeg TOM trackings and endings segmentations, sampling each tensor map along every tract. Use it after TractSeg to obtain along-tract microstructure profiles for group analyses. Needs a TractSeg output (with TOM_trackings and endings_segmentations) and tensor maps in the same space.

| | |
|---|---|
| **Inputs** | `neuro/tractseg` · `neuro/tensor` |
| **Outputs** | `neuro/tractmeasures` ×4 |
| **Container** | `brainlife/tractseg:2.7` |
| **Resources** | 4 CPUs · 0.5 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.708](https://doi.org/10.25663/brainlife.app.708) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `tractseg` | `neuro/tractseg` | yes | TractSeg output |
| `tensor` | `neuro/tensor` | yes | Tensor, which should be in the same space as the tractseg output. Tractometry is run over FA, MD, RD, and AD. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `tractseg_tractometry_fa` | `neuro/tractmeasures` | Tractometry over FA |
| `tractseg_tractometry_md` | `neuro/tractmeasures` | Tractometry over MD |
| `tractseg_tractometry_rd` | `neuro/tractmeasures` | Tractometry over RD |
| `tractseg_tractometry_ad` | `neuro/tractmeasures` | Tractometry over AD |

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.708](https://doi.org/10.25663/brainlife.app.708), choose a TractSeg output (`neuro/tractseg`) and a tensor dataset (`neuro/tensor`) in the same space, and press **Execute**. For each tract in the segmentation, the App computes the tract profile of FA, MD, RD and AD, and writes four `neuro/tractmeasures` datasets (tagged `tractseg_tractometry` and `FA`, `MD`, `RD` or `AD`) to your project. Use it after TractSeg to obtain along-tract microstructure profiles for group analyses.

**Inputs**

- **TractSeg output**: must contain the `TOM_trackings` (tract tractograms, `.tck`) and `endings_segmentations` directories.
- **Tensor**: a tensor dataset containing `fa.nii.gz`, `md.nii.gz`, `rd.nii.gz` and `ad.nii.gz`, in the same space as the TractSeg output.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) and [`jq`](https://jqlang.github.io/jq/). The App runs in the `brainlife/tractseg:2.7` container.

1. Clone this repository and check out the registered version (`git checkout 2.7`).
2. Create `config.json` with the paths to your inputs:

   ```json
   {
       "endings_segmentations": "./input/endings_segmentations",
       "TOM_trackings": "./input/TOM_trackings",
       "fa": "./input/fa.nii.gz",
       "md": "./input/md.nii.gz",
       "rd": "./input/rd.nii.gz",
       "ad": "./input/ad.nii.gz"
   }
   ```

3. Run the App:

   ```bash
   ./main
   ```

## Outputs

```text
tractseg_tractometry_fa/tractmeasures.csv   FA profiles of every tract
tractseg_tractometry_md/tractmeasures.csv   MD profiles
tractseg_tractometry_rd/tractmeasures.csv   RD profiles
tractseg_tractometry_ad/tractmeasures.csv   AD profiles
```

## Troubleshooting

- **The App finishes without any output**: the tensor input has no `fa.nii.gz`. Tractometry currently runs only on the FA, MD, RD and AD maps of a tensor dataset.

## Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

- Wasserthal J, Neher P, Maier-Hein KH. TractSeg – Fast and accurate white matter tract segmentation. *NeuroImage* 183:239–253 (2018). [doi:10.1016/j.neuroimage.2018.07.070](https://doi.org/10.1016/j.neuroimage.2018.07.070)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)
- Tractometry over tensor. brainlife.io App. [doi:10.25663/brainlife.app.708](https://doi.org/10.25663/brainlife.app.708)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)

## Authors

- Giulia Bertò

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## License

[MIT](LICENSE.md). TractSeg is distributed under the [Apache License 2.0](https://github.com/MIC-DKFZ/TractSeg/blob/master/LICENSE).
