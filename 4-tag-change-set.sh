#!/usr/bin/env bash
set -Eeuxo pipefail

PASSWORD=pass

liquibase tag \
	--url jdbc:neo4j:bolt://localhost \
	--username neo4j \
	--password "${PASSWORD}" \
	--tag=my-life-movie