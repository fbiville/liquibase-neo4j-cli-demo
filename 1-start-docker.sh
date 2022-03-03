#!/usr/bin/env bash
set -Eeuxo pipefail

NEO4J_VERSION=4.4-enterprise
PASSWORD=pass

container_id=$(docker run \
	--detach --rm \
	--env NEO4J_ACCEPT_LICENSE_AGREEMENT=yes \
	--env NEO4J_AUTH="neo4j/${PASSWORD}" \
	--publish=7687:7687 \
	--publish=7474:7474 \
	--health-cmd 'cypher-shell -u neo4j -p pass '\''RETURN 1'\''' \
	--health-interval 5s \
	--health-timeout 5s \
	--health-retries 5 \
	"neo4j:${NEO4J_VERSION}")

until docker inspect --format "{{json .State.Health.Status }}" "${container_id}" | grep --quiet --max-count 1  "healthy"; do
	sleep 2;
done