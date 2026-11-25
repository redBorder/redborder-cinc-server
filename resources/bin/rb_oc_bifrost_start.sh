#!/bin/bash
exec 2>&1

export PATH=/opt/cinc-project/bin:/opt/cinc-project/embedded/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin

umask 022

export GEM_PATH=/opt/cinc-project/embedded/service/gem/ruby/3.1.0
export GEM_HOME=/opt/cinc-project/embedded/service/gem/ruby/3.1.0

exec veil-env-helper --use-file -f /etc/cinc-project/private-cinc-secrets.json -s oc_bifrost.sql_password -s oc_bifrost.superuser_id -- env ERL_EPMD_ADDRESS=0.0.0.0 HOME=/var/opt/cinc-project/oc_bifrost /opt/cinc-project/embedded/service/oc_bifrost/bin/oc_bifrost foreground
