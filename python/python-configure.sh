#!/usr/bin/env bash

set -eu

usage () {
  echo "Usage: $0: [-v] [-d]
Where:
 -v is verbose
 -d is dryrun"
}

# Set default value
dryrun="false"
# Parse arguments
# https://pubs.opengroup.org/onlinepubs/9799919799/utilities/getopts.html
while getopts ":vd" opt; do
  case $opt in
    v)
      echo "Running in verbose mode"
      set -x
      ;;
    d)
      echo "Running in dryrun mode"
      dryrun="true"
      ;;
    :)
      echo "Option ${OPARG} requires an argument"
      exit 1
      ;;
    ?)
      echo "Invalid option: -${OPTARG}"
      usage
      exit 1
      ;;
  esac
done
shift $((OPTIND-1))

python_versions=(
  "3.7.16"
  "3.8.20"
  "3.9.20"
  "3.10.15"
  "3.11.10"
  "3.12.6"
  # "3.13.0"
)

if ! hash pyenv 2>/dev/null; then
  echo "Error: no pyenv found." && exit 127
fi
echo "Using pyenv to install Python"
for version in "${python_versions[@]}"; do
  echo "Installing $version"
  test $dryrun == "false" && pyenv install "$version"
done

latest_idx=$((${#python_versions[@]}-1))
latest=${python_versions[$latest_idx]}
echo "Setting default global python = ${latest} "
test $dryrun == "false" && pyenv global "${latest}"
