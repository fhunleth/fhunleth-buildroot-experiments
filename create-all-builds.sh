#!/bin/bash

configs=$(find ./configs -name "*_defconfig")

for config in $configs; do
    base=$(basename -s _defconfig $config)

    echo "Creating $config..."
    ./create-build.sh $config
    if [[ $? != 0 ]]; then
        echo "--> './create-build.sh $config' failed!"
        exit 1
    fi
done

