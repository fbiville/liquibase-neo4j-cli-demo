--liquibase formatted cypher
--changeset fbiville:count-movies runAlways:true
MATCH (m:Movie) WITH COUNT(m) AS count MERGE (c:Count) SET c.value = count
--rollback MATCH (c:Count) DETACH DELETE c
