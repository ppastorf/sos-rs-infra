#!/usr/bin/env bash

source ../.env

# coloca arquivo de dump na jumpbox, o extrai e restaura no banco
#
# requisitos
# 1.  arquivo com dump do banco presente localmente
# 2.  jumpbox rodando na mesma vpc que o rds, com ubuntu ou debian linux
# 2.1 conectividade entre a jumpbox e o endpoint do rds
# 2.2 jumpbox acessivel via ssh

# config
DB_HOST=""
DB_PORT=""
DB_NAME=""
DB_USER=""
DB_PASS=""

JUMPBOX_HOST=""
JUMPBOX_USER=""
JUMPBOX_SSHKEY=""

DUMP_FILE=""

scp -i $JUMPBOX_SSHKEY $DUMP_FILE ${JUMPBOX_USER}@${JUMPBOX_HOST}:/tmp/dump.zip
ssh -T -i $JUMPBOX_SSHKEY ${JUMPBOX_USER}@${JUMPBOX_HOST} 1>/dev/null <<EOF
  set -eu
  sudo apt-get install -y unzip > /dev/null 
  unzip -o -qq -d /tmp/dump /tmp/dump.zip
  export PGPASSWORD='$DB_PASS'
  pg_restore -h '$DB_HOST' -p '$DB_PORT' -U '$DB_USER' -d '$DB_NAME' \$(find /tmp/dump/* -name "*.sql" | head -n1)
  rm -rf /tmp/dump.zip /tmp/dump
EOF

