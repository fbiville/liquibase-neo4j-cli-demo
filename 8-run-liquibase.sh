#!/usr/bin/env bash
set -Eeuxo pipefail

PASSWORD=pass

liquibase update \
	--changelog-file ./changeLog.xml \
	--url jdbc:neo4j:bolt://localhost \
	--username neo4j \
	--password "${PASSWORD}"

liquibase history \
	--url jdbc:neo4j:bolt://localhost \
	--username neo4j \
	--password "${PASSWORD}"