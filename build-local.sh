#!/bin/bash
# Process building blocks into build-local/ using this register's public base URL instead of the
# localhost viewer URL, so that other registers can import this local build (via url-mappings in
# their bblocks-config-local.yml) while developing a change here. The base URL is autodetected
# from the git remote; pass --base-url to override it (e.g. when working on a fork).
exec "$(dirname "$0")/build.sh" --base-url "" "$@"
