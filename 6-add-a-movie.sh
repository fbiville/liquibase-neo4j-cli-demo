#!/usr/bin/env bash
set -Eeuxo pipefail

PASSWORD=pass

# liquibase not really needed here, but good excuse for me to learn about that command :D
liquibase execute-sql \
	--url jdbc:neo4j:bolt://localhost \
	--username neo4j \
	--password "${PASSWORD}" \
	--sql="CREATE (:Movie {title: 'My 2nd Life'})"