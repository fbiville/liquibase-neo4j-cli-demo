#!/usr/bin/env bash
set -Eeuxo pipefail

LIQUIBASE_NEO4J_VERSION="4.8.0.1"

brew install --quiet liquibase

export LIQUIBASE_HOME="$(brew --prefix liquibase)/libexec"

plugin_full_jar="https://github.com/liquibase/liquibase-neo4j/releases/download/liquibase-neo4j-${LIQUIBASE_NEO4J_VERSION}/liquibase-neo4j-${LIQUIBASE_NEO4J_VERSION}-full.jar"

curl --silent \
	--location "${plugin_full_jar}" \
	--output "${LIQUIBASE_HOME}/lib/liquibase-neo4j-${LIQUIBASE_NEO4J_VERSION}.jar"