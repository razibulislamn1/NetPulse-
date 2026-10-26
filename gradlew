#!/bin/sh
# Minimal Gradle wrapper launcher. Downloads gradle-wrapper.jar on first run if it is missing.
APP_HOME=$(cd "$(dirname "$0")" && pwd -P)
JAR="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"
if [ ! -f "$JAR" ]; then
  echo "gradle-wrapper.jar not found, downloading..."
  URL="https://raw.githubusercontent.com/gradle/gradle/v8.2.0/gradle/wrapper/gradle-wrapper.jar"
  mkdir -p "$APP_HOME/gradle/wrapper"
  if command -v curl >/dev/null 2>&1; then
    curl -fL -o "$JAR" "$URL" || rm -f "$JAR"
  elif command -v wget >/dev/null 2>&1; then
    wget -O "$JAR" "$URL" || rm -f "$JAR"
  fi
  if [ ! -f "$JAR" ]; then
    echo "Download failed. Copy gradle-wrapper.jar from another Android project into gradle/wrapper/." >&2
    exit 1
  fi
fi
if [ -n "$JAVA_HOME" ] && [ -x "$JAVA_HOME/bin/java" ]; then JAVACMD="$JAVA_HOME/bin/java"; else JAVACMD=java; fi
exec "$JAVACMD" -Dorg.gradle.appname=gradlew -classpath "$JAR" org.gradle.wrapper.GradleWrapperMain "$@"
