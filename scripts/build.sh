#!/bin/sh
rm -rf dist && \
babel src -d dist --copy-files --source-maps && \
rm dist/setupTests.js && rm dist/setupTests.js.map && \
find dist -name "*.test.js*" | xargs rm
