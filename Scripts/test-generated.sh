#!/bin/sh

set -eo pipefail

cd ./Tests/CreateAPITests/AllPackages
swift build --verbose
