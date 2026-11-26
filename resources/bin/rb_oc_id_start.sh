#!/bin/bash
exec 2>&1

umask 022

DIR=/opt/cinc-project/embedded/service/oc_id
export RAILS_ENV=production
PATH=/opt/cinc-project/bin:/opt/cinc-project/embedded/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin
export LD_LIBRARY_PATH=/opt/cinc-project/embedded/lib
export HOME=$DIR

export GEM_PATH=/opt/cinc-project/embedded/service/gem/ruby/3.1.0
export GEM_HOME=/opt/cinc-project/embedded/service/gem/ruby/3.1.0

rm -f $DIR/tmp/pids/server.pid
cd $DIR

SECRETS=${CHEF_SECRETS_FILE:-/etc/cinc-project/private-cinc-secrets.json}

exec veil-env-helper -f "$SECRETS" --use-file -s chef-server.webui_key -s oc_id.sql_password -s oc_id.secret_key_base -- /opt/cinc-project/embedded/bin/bundle exec bin/rails server -p 9090 -b 127.0.0.1