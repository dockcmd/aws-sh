#!/bin/sh
. shmod
import github.com/dockcmd/sh@v0.0.4 docker.sh

t9t="$t9t"
e="${e-AWS}"

docker_run dcmd/aws:v1.16.306 "$@"
