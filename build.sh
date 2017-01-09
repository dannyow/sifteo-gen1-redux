#!/bin/bash

NAME="sifteo-gen1"
IDENTIFIER="sifteo.redux.$NAME"

# Package version number (inherited from Siftrunner.app version)
VERSION="1.1.5-r01"

INSTALL_LOCATION="/tmp/Sifteo"

mkdir -p dist

# Remove any unwanted .DS_Store files.
find payload -name '*.DS_Store' -type f -delete

# Remove any extended attributes (ACEs).
/usr/bin/xattr -rc payload

# Build package...
pkgbuild \
    --root payload/ \
    --install-location "$INSTALL_LOCATION" \
    --scripts scripts/ \
    --identifier "$IDENTIFIER" \
    --version "$VERSION" \
    "dist/$NAME-$VERSION.pkg"