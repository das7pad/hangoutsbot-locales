#!/bin/bash

echo "Merging messages"

# change base dir to locale repo level
LOCALE_DIR="$(cd "$(dirname $0)" && pwd)"
cd $LOCALE_DIR

# update paths/lines of already translated entrys and add new entrys
# as the english version is already processed, we drop it here in the head
for LOCALE in `find * -maxdepth 0 -type d -not -path "en"`; do \
    LOCALE_DIR=$LOCALE/LC_MESSAGES
    msgmerge -q --update --no-fuzzy-matching --backup=off \
        $LOCALE_DIR/hangupsbot.po messages.pot
done
