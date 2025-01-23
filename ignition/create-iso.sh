#!/usr/bin/sh

set -e
set -o pipefail

[ $# -ne 2 ] && { echo "Usage: $0 BUTANE INSTALL_DISK"; exit 1; }

INPUT_BUTANE=$1
INSTALL_DISK=$2
OUTPUT_IGNITION="${INPUT_BUTANE%.bu}.ign"
OUTPUT_ISO="${INPUT_BUTANE%.bu}-${INSTALL_DISK##*/}.iso"
BUTANE_CMD="podman run --rm --interactive --security-opt label=disable --volume $(pwd):/pwd --workdir /pwd quay.io/coreos/butane:release"
COREOS_INSTALLER_CMD="podman run --rm --privileged --interactive --volume $(pwd):/pwd --workdir /pwd quay.io/coreos/coreos-installer:release"

echo "Generating ignition"
${BUTANE_CMD} --pretty --strict "$INPUT_BUTANE" > "$OUTPUT_IGNITION"
#ignition-validate "$OUTPUT_IGNITION"

if [ ! -f fedora-coreos.iso ]; then
    echo "Downloading Fedora coreos"
    FCOS_ISO=$(${COREOS_INSTALLER_CMD} download -f iso --decompress)
    mv "$FCOS_ISO" fedora-coreos.iso
fi

if [ -f "$OUTPUT_ISO" ]; then
    rm "$OUTPUT_ISO"
fi

echo "Embedding ignition"
${COREOS_INSTALLER_CMD} iso customize \
    --dest-ignition "$OUTPUT_IGNITION" \
    --dest-device "$INSTALL_DISK" \
    -o "$OUTPUT_ISO" \
    fedora-coreos.iso

echo "Created $OUTPUT_ISO"
