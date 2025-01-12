#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if ! command devpod > /dev/null 2>&1; then
  "${SCRIPT_DIR}/install-devpod.sh"
fi

# build the provider with a dummy version
# note: if the current version was stored in a VERSION file,
#       we could bump it and append -rc0
RELEASE_VERSION=0.0.1-rc1 "${SCRIPT_DIR}/build.sh"

# patch the provider.yaml with local paths
REPLACEMENT_PATH="${SCRIPT_DIR}/../dist"
sed -i -E "s|https://github\.com/mrsimonemms/devpod-provider-hetzner/releases/download/[^/]+/|$REPLACEMENT_PATH/|g" "${SCRIPT_DIR}/../dist/provider.yaml"

devpod provider add --name hetzner "${SCRIPT_DIR}/../dist/provider.yaml" -o TOKEN=$TOKEN
