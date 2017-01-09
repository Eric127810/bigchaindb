#!/bin/bash

set -e -x

if [[ "${TOXENV}" == *-rdb ]]; then
    rethinkdb --daemon
elif [[ "${BIGCHAINDB_DATABASE_BACKEND}" == mongodb ]]; then
    echo 'Setting up mongodb'
    wget http://downloads.mongodb.org/linux/mongodb-linux-x86_64-3.4.1.tgz -O /tmp/mongodb.tgz
    tar -xvf /tmp/mongodb.tgz
    mkdir /tmp/data
    ${PWD}/mongodb-linux-x86_64-3.4.1/bin/mongod --dbpath /tmp/data --replSet=rs0 &
fi
