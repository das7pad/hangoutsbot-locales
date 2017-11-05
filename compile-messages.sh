#!/bin/bash

echo "Compiling messages"

# change base dir to locale repo level
LOCALE_DIR="$(cd "$(dirname $0)" && pwd)"
cd $LOCALE_DIR

for LOCALE in `find * -maxdepth 0 -type d`; do \
    LOCALE_DIR=$LOCALE/LC_MESSAGES
    msgfmt "$LOCALE_DIR"/hangupsbot.po --output-file $LOCALE_DIR/hangupsbot.mo
done
