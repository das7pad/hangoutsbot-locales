#!/bin/bash

echo "Updating messages"

DIR="`dirname $0`/"
xgettext --files-from="$DIR"POTFILES.in --directory="$DIR".. --output="$DIR"messages.pot
msgen messages.pot --directory="$DIR" -o "$DIR"en/LC_MESSAGES/hangupsbot.po
