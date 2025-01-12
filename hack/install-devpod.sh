#!/usr/bin/env bash

# see: https://devpod.sh/docs/getting-started/install#optional-install-devpod-cli
curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64" && sudo install -c -m 0755 devpod /usr/local/bin && rm -f devpod
