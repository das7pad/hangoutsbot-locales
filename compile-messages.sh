#!/bin/bash
# run with additional argument to see a process log

echo "Compiling messages"

# change base dir to locale repo level
LOCALE_DIR="$(cd "$(dirname $0)" && pwd)"
cd $LOCALE_DIR

LOG_VERBOSE="$1"

log_complete() {
    if [ ! -z $LOG_VERBOSE ]; then \
        echo " compiled: ${1^^}"
    fi
}

for LOCALE in `find * -maxdepth 0 -type d`; do \
    LOCALE_DIR=$LOCALE/LC_MESSAGES
    msgfmt "$LOCALE_DIR"/hangupsbot.po --output-file $LOCALE_DIR/hangupsbot.mo
    log_complete $LOCALE
done
