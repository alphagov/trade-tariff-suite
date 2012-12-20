#!/bin/sh

set -x

MYTASK="test:localnetwork"

bundle install --path "${HOME}/bundles/${JOB_NAME}" --deployment --quiet
bundle exec rake $MYTASK
