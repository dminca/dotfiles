#!/bin/bash
# Check for enough free RAM before disabling the Swap;
# insufficient RAM will make your System unstable.
# Copyright (C) 2015 Minca Daniel Andrei - All Rights Reserved
# Permission to copy and modify is granted under the GPL V2 license

free_data="$(free)"
memory_data="$(echo "$free_data" | grep 'Mem:')"
total_free_space="$(echo "$memory_data" | awk '{print $4 + $6 + $7}')"
used_swap_space="$(echo "$free_data" | grep 'Swap:' | awk '{print $3}')"

echo -e "Free memory:\t$total_free_space kB ($((total_free_space / 1024)) MB)\nUsed swap:\t$used_swap_space kB ($((used_swap_space / 1024)) MB)"
if [[ $used_swap_space -eq 0 ]]; then
    echo "Congratulations! No swap is in use."
elif [[ $used_swap_space -lt $total_free_space ]]; then
    echo "Freeing swap..."
    sudo swapoff -a
    sudo swapon -a
else
    echo "Not enough free memory. Exiting."
    exit 1
fi
