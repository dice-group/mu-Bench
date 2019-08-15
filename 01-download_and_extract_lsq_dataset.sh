#!/usr/bin/env bash
mkdir -p data/toLoad || exit
cd data/toLoad || exit
wget -qO- "$1" | bzip2 -d > load.nt