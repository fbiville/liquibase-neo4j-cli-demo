#!/usr/bin/env bash
set -Eeuxo pipefail

PASSWORD=pass

liquibase rollback \
	--changelog-file ./changeLog.xml \
	--url jdbc:neo4j:bolt://localhost \
	--username neo4j \
	--password "${PASSWORD}" \
	--tag my-life-movie

liquibase history \
	--url jdbc:neo4j:bolt://localhost \
	--username neo4j \
	--password "${PASSWORD}"