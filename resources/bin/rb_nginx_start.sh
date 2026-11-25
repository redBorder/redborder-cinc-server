#!/bin/bash
exec 2>&1
export PATH=/opt/cinc-project/bin:/opt/cinc-project/embedded/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin

ulimit -c 0
ulimit -d unlimited
ulimit -e 0
ulimit -f unlimited
ulimit -i 62793
ulimit -l 64
ulimit -m unlimited
# WARNING: Increasing the global file descriptor limit increases RAM
# consumption on startup dramatically!
ulimit -n 50000
ulimit -q 819200
ulimit -r 0
ulimit -s 10240
ulimit -t unlimited
ulimit -u unlimited
ulimit -v unlimited
ulimit -x unlimited
echo "1000000" > /proc/sys/fs/file-max

export GEM_PATH=/opt/cinc-project/embedded/service/gem/ruby/3.1.0
export GEM_HOME=/opt/cinc-project/embedded/service/gem/ruby/3.1.0 

exec /opt/cinc-project/embedded/bin/veil-env-helper -f /etc/cinc-project/private-cinc-secrets.json -o DATA_COLLECTOR_TOKEN=data_collector.token -s REDIS_PASSWORD=redis_lb.password -- \
  chpst \
  -P env TZ=UTC \
  /opt/cinc-project/embedded/sbin/nginx -c /var/opt/cinc-project/nginx/etc/nginx.conf