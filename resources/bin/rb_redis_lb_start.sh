#!/bin/bash
exec 2>&1
umask 022

export GEM_PATH=/opt/cinc-project/embedded/service/gem/ruby/3.1.0
export GEM_HOME=/opt/cinc-project/embedded/service/gem/ruby/3.1.0
export PATH=/opt/cinc-project/bin:/opt/cinc-project/embedded/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin

SECRETS=${CHEF_SECRETS_FILE:-/etc/cinc-project/private-cinc-secrets.json}

exec /opt/cinc-project/embedded/bin/veil-env-helper -f "$SECRETS" -s REDIS_PASSWORD=redis_lb.password -- env HOME="/var/opt/cinc-project/redis_lb" /bin/bash -c 'exec /opt/cinc-project/embedded/bin/redis-server - < <(printf "include /var/opt/cinc-project/redis_lb/etc/redis.conf\nrequirepass %s\n" "$REDIS_PASSWORD")'
