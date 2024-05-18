#!/usr/bin/env bash

# coloca arquivo de dump na jumpbox, o extrai e restaura no banco
#
# requisitos
# 1.  arquivo com dump do banco presente localmente
# 2.  jumpbox rodando na mesma vpc que o rds, com ubuntu ou debian linux
# 2.1 conectividade entre a jumpbox e o endpoint do rds
# 2.2 jumpbox acessivel via ssh

# config
DB_HOST=""
DB_PORT="5432"
DB_NAME="sos_rs_db"
DB_USER="postgres"
DB_PASS=""

JUMPBOX_HOST=""
JUMPBOX_USER="ubuntu"
JUMPBOX_SSHKEY=""

DUMP_FILE="data/postgres/dump.sql"

scp -i $JUMPBOX_SSHKEY $DUMP_FILE ${JUMPBOX_USER}@${JUMPBOX_HOST}:/tmp/dump.sql
ssh -T -i $JUMPBOX_SSHKEY ${JUMPBOX_USER}@${JUMPBOX_HOST} 1>/dev/null <<EOF
  set -eu
  sudo apt-get install -y postgresql-client > /dev/null 
  PGPASSWORD='$DB_PASS' psql -h '$DB_HOST' -p '$DB_PORT' -U '$DB_USER' -f /tmp/dump.sql
  rm /tmp/dump.sql
EOF

