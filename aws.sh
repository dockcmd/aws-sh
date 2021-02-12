#!/bin/bash
# must be run under /bin/bash or <(env) below will cause an unexpected token `('

. shmod
import dockcmd/sh@v0.0.2 docker.sh

exec_or_dryrun \
  $(docker_run) \
  --env-file <(env|grep ^AWS_) \
  --mount type=bind,source=$HOME/.aws,target=/root/.aws,consistency=delegated \
  --mount type=bind,source=$HOME/.kube,target=/root/.kube,consistency=delegated \
  $(docker_workdir) \
  $(docker_image dcmd/aws:v1.16.306) \
  "$@"
