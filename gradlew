#!/bin/sh
set -e
APP_HOME=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
GRADLE_VERSION=8.10.1
DIST="$HOME/.gradle/wrapper/dists/gradle-$GRADLE_VERSION-bin"
GRADLE_HOME="$DIST/gradle-$GRADLE_VERSION"
if [ ! -x "$GRADLE_HOME/bin/gradle" ]; then
  mkdir -p "$DIST"
  TMP="$DIST/gradle.zip"
  if command -v curl >/dev/null 2>&1; then
    curl -fL --retry 3 -o "$TMP" "https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip"
  elif command -v wget >/dev/null 2>&1; then
    wget -O "$TMP" "https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip"
  else
    echo "curl or wget is required to bootstrap Gradle." >&2
    exit 1
  fi
  rm -rf "$GRADLE_HOME"
  unzip -q "$TMP" -d "$DIST"
  rm -f "$TMP"
fi
exec "$GRADLE_HOME/bin/gradle" "$@"
