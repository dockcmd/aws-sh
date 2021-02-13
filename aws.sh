#!/bin/sh
. shmod
import dockcmd/sh@v0.0.3 docker.sh

run `e=^AWS_ hwd= docker dcmd/aws:v1.16.306 "$@"`
