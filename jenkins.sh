#!/bin/sh

set -x

MYTASK="test:localnetwork"

bundle install --path "${HOME}/bundles/${JOB_NAME}" --deployment --quiet
TARGET_PLATFORM=production bundle exec rake $MYTASK
