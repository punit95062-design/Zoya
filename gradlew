#!/bin/sh
set -eu

# GitHub Actions installs Gradle explicitly. For local use, delegate to a Gradle
# installation available on PATH.
if command -v gradle >/dev/null 2>&1; then
  exec gradle "$@"
fi

echo "Gradle is not installed. Install Gradle 8.10.1 or run this project through GitHub Actions." >&2
exit 1
