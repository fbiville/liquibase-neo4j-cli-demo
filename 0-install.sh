#!/usr/bin/env bash
set -Eeuxo pipefail

LIQUIBASE_NEO4J_VERSION="4.15.0.3"

brew install --quiet liquibase

export LIQUIBASE_HOME="$(brew --prefix liquibase)/libexec"

plugin_full_jar="https://repo.maven.apache.org/maven2/org/liquibase/ext/liquibase-neo4j/${LIQUIBASE_NEO4J_VERSION}/liquibase-neo4j-${LIQUIBASE_NEO4J_VERSION}-full.jar"

curl --silent \
	--location "${plugin_full_jar}" \
	--output "${LIQUIBASE_HOME}/lib/liquibase-neo4j-${LIQUIBASE_NEO4J_VERSION}.jar"
