#!/bin/bash

##Tractometry is run over FA, MD, RD, and AD.
echo "running Tractometry"

TOM_trackings=`jq -r '.TOM_trackings' config.json`
endings_segmentations=`jq -r '.endings_segmentations' config.json`

fa=`jq -r '.fa' config.json`

if [ -f $fa ]; then

    cp `jq -r '.fa' config.json` fa.nii.gz
    cp `jq -r '.md' config.json` md.nii.gz
    cp `jq -r '.rd' config.json` rd.nii.gz
    cp `jq -r '.ad' config.json` ad.nii.gz

    vars=( fa md rd ad )

    for m in "${vars[@]}"
    do  
        var="${m}"
        outdir=tractseg_tractometry_$var
        mkdir -p $outdir

        Tractometry -i $TOM_trackings \
            -o $outdir/tractmeasures.csv \
            -e $endings_segmentations \
            -s ${var}.nii.gz \
            --tracking_format tck 
    done

else
    echo ""
    #TO DO: add code for spherical means
fi    