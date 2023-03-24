# shellcheck shell=bash

if [ -n "${GOPATH}" ] && [ ! -d "${GOPATH}/src" ] || [ ! -d "${GOPATH}/bin" ]; then
    mkdir -p "${GOPATH}/src"
    mkdir -p "${GOPATH}/bin"
fi

