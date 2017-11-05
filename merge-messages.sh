#!/bin/bash
# run with additional argument to see a process log

echo "Merging messages"

# change base dir to locale repo level
LOCALE_DIR="$(cd "$(dirname $0)" && pwd)"
cd $LOCALE_DIR

LOG_VERBOSE="$1"

log_complete() {
    if [ ! -z $LOG_VERBOSE ]; then \
        echo "  merged: ${1^^}"
    fi
}

# update paths/lines of already translated entrys and add new entrys
# as the english version is already processed, we drop it here in the head
for LOCALE in `find * -maxdepth 0 -type d -not -path "en"`; do \
    LOCALE_DIR=$LOCALE/LC_MESSAGES
    msgmerge -q --update --no-fuzzy-matching --backup=off \
        $LOCALE_DIR/hangupsbot.po messages.pot
    log_complete $LOCALE
done
