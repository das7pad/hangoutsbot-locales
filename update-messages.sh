#!/bin/bash

echo "Updating messages"

# change base dir to parent repo level
LOCALE_DIR="$(cd "$(dirname $0)" && pwd)"
cd "$LOCALE_DIR/../../"

# update python-file list
find hangupsbot -name '*.py' > $LOCALE_DIR/POTFILES.in

TARGET=$LOCALE_DIR/messages.pot

# find strings per module
xgettext --files-from $LOCALE_DIR/POTFILES.in --output $TARGET

# update charset to `UTF-8`
sed -r "s/charset=CHARSET/charset=UTF-8/" --in-place $TARGET

# clear the english template
msgen $TARGET --output-file $LOCALE_DIR/en/LC_MESSAGES/hangupsbot.po
