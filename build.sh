#!/bin/bash
# Process building blocks
if [ -f '.volumes' ]; then
  VOLUMES=$(while read -r line; do
    if [[ "${line}" != /* ]]; then
      echo -n "-v ${PWD}/${line} "
    else
      echo -n "-v $line "
    fi
  done < .volumes)
fi
# -it only when stdin is a terminal, so permission prompts can be answered; without one
# (agents, CI, scripted runs) pass --skip-permissions true instead
docker run $([ -t 0 ] && echo -it ) --pull=always --rm --workdir /workspace -v "$(pwd):/workspace" ${VOLUMES} \
  ghcr.io/opengeospatial/bblocks-postprocess:${BBP_IMAGE_TAG:-latest} \
  --clean true --base-url http://localhost:9090/register/ "$@"
