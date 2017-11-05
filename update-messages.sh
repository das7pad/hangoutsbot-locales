#!/bin/bash

echo "Updating messages"

# change base dir to parent repo level
DIR="$(cd "$(dirname $0)" && pwd)"
cd "$DIR/../../"

# update python-file list
find hangupsbot -name '*.py' > $DIR/POTFILES.in

TARGET=$DIR/messages.pot

# find strings per module
xgettext --files-from $DIR/POTFILES.in --output $TARGET

# update charset to `UTF-8`
sed -r "s/charset=CHARSET/charset=UTF-8/" --in-place $TARGET

# clear the english template
msgen $TARGET --output-file $DIR/en/LC_MESSAGES/hangupsbot.po
