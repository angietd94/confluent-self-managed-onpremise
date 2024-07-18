#!/bin/sh

export ENVID = "env-rrr650"
export CLUSTERID = "lkc-n06nxk"
export CLUSTERAPIKEY = "XK7JDNBR2BO3JK55"
export CLUSTERAPISECRET = "gZpcGHSSlqmYaPb/knvcIHx+n9jzouAOseSArpdTg+8TUs0wqmM3qhrJeQXqXfl5"
export ACCOUNTPW=""
export EMAIL=""
export ORG_ID="***-***-***-***-****"
export SR_API_KEY="6ZF5E6EGWAHTJJOO"
export SR_API_SECRET="****"
export BOOTSTRAP_SERVERS="pkc-z9doz.eu-west-1.aws.confluent.cloud:9092"
export SCHEMA_REGISTRY_URL="https://psrc-8vyvr.eu-central-1.aws.confluent.cloud"
export CLOUD_KEY="6ZF5E6EGWAHTJJOO"
export CLOUD_SECRET="HTlgdRK9uFpwwr+BXCBx+1dzXGkmg9YXqqEeVBGueU6mfw9JQp6nZ6JWN+Y+OtDd"
export CONFLUENT_USERNAME="ataccadughetti+ubb@confluent.io"
export CONFLUENT_PASSWORD="SabaTbilisi?1996"


'''
#export CONFLUENT_USERNAME="****"
#export CONFLUENT_PASSWORD="***"
export CLOUD_KEY="*****"
export CLOUD_SECRET="*****"
export ORG_ID="***-***-***-***-****"
export ENVID="env-****"
export EMAIL=""
export ACCOUNTPW=""
export CLUSTERID="lkc-***"
export CLUSTERAPIKEY="*****"
export CLUSTERAPISECRET="******"
export SR_API_KEY="****"
export SR_API_SECRET="****"
export BOOTSTRAP_SERVERS="*****:****"
export SCHEMA_REGISTRY_URL="****+"
'''



#Either us, eu
export GEO="eu"
export REGION="eu-west-1"


#for example, aws or gcp
export CLOUDPROVIDER="aws"







export SASL_JAAS_CONFIG="org.apache.kafka.common.security.plain.PlainLoginModule required username=$CLUSTERAPIKEY password=$CLUSTERAPISECRET;"
export SASL_JAAS_CONFIG_PROPERTY_FORMAT="org.apache.kafka.common.security.plain.PlainLoginModule required username=$CLUSTERAPIKEY password=$CLUSTERAPISECRET;"
export REPLICATOR_SASL_JAAS_CONFIG="org.apache.kafka.common.security.plain.PlainLoginModule required username=$CLUSTERAPIKEY' password=$CLUSTERAPISECRET;"
export BASIC_AUTH_CREDENTIALS_SOURCE="USER_INFO"
export SCHEMA_REGISTRY_BASIC_AUTH_USER_INFO=$SR_API_KEY:$SR_API_SECRET

## CLICKHOUSE DATA

export TOPIC="*****"
export DATABASE_NAME="default"
export DATABASE_PASSWORD="*****"
export CLICKHOUSE_HOSTNAME="****"