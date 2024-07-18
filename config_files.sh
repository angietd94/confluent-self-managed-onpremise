#!/bin/sh

source config.sh
echo "Creating the Debezium MYSQL connector .... "

echo $TOPIC
echo $DATABASE_HOSTNAME
echo $DATABASE_NAME
echo $DATABASE_PASSWORD
echo $SCHEMA_REGISTRY_URL

    curl -i -X POST http://localhost:8083/connectors -H "Content-Type:application/json" -H "Accept: application/json" \
    -d '{
            "name": "mysql-debezium",
            "config": {
               {
                    "connector.class": "io.debezium.connector.mysql.MySqlConnector", "database.hostname": $DATABASEHOSTNAME,
                    "database.port": "3306",
                    "database.user": $DATABASE_USER,
                    "database.password": $DATABASE_PASSWORD,
                    "database.server.id": "1",
                    "topic.prefix": "mysql",
                    "database.include.list": "syndixisdemohead", "schema.history.internal.kafka.bootstrap.servers": "XX", "schema.history.internal.kafka.sasl.mechanism": "PLAIN", "schema.history.internal.kafka.topic": "testcdc", "schema.history.internal.kafka.security.protocol": "SASL_SSL",
                    "schema.history.internal.kafka.sasl.jaas.config": "org.apache.kafka.common.security.plain.PlainLoginModule required username=$SASL_USERNAME password=$SASL_PW;",
                    "schema.history.internal.consumer.security.protocol": "SASL_SSL",
                    "schema.history.internal.consumer.sasl.jaas.config": "org.apache.kafka.common.security.plain.PlainLoginModule required username=$SASL_USERNAME password=$SASL_PW;",
                    "schema.history.internal.consumer.sasl.mechanism": "PLAIN",
                    "schema.history.internal.producer.security.protocol": "SASL_SSL",
                    "schema.history.internal.producer.sasl.jaas.config": "org.apache.kafka.common.security.plain.PlainLoginModule required username=$SASL_USERNAME password=$SASL_PW;",
                    "schema.history.internal.producer.sasl.mechanism": "PLAIN", "include.schema.changes": "true",
                    "snapshot.mode": "initial", "topic.creation.default.replication.factor": 3,
                    "topic.creation.default.partitions": 4,
                    "topic.creation.default.compression.type": "snappy",
                    "transforms": "insertDBName,removeDBName,insertTenantId",
                    "transforms.removeDBName.type": "org.apache.kafka.connect.transforms.RegexRouter", "transforms.removeDBName.regex": "testcdc.([^.]*).(.*)", "transforms.removeDBName.replacement": "$2",
                    "transforms.insertDBName.type": "org.apache.kafka.connect.transforms.InsertField$Value", "transforms.insertDBName.topic.field": "DatabaseName",
                    "transforms.insertTenantId.type": "org.apache.kafka.connect.transforms.InsertField$Value", "transforms.insertTenantId.static.field": "TenantId", "transforms.insertTenantId.static.value": "XX"
                    }
            }
    }'


sleep 30


bash -c ' \
echo -e "\n\n=============\nWaiting for Kafka Connect to start listening on localhost ⏳\n=============\n"
while [ $(curl -s -o /dev/null -w %{http_code} http://localhost:8083/connectors) -ne 200 ] ; do
  echo -e "\t" $(date) " Kafka Connect listener HTTP state: " $(curl -s -o /dev/null -w %{http_code} http://localhost:8083/connectors) " (waiting for 200)"
  sleep 15
done
echo -e $(date) "\n\n--------------\n\o/ Kafka Connect is ready! Listener HTTP state: " $(curl -s -o /dev/null -w %{http_code} http://localhost:8083/connectors) "\n--------------\n"
'

sleep 10s




# VERIFY THE CONNECTOR STATUS
http http://localhost:8083/connectors/mysql-debezium/status -b

#open http://localhost:8083/connector-plugins

#Verify connectors
#open http://localhost:8083/connectors/
