#!/bin/bash
exec 2>&1

export PATH=/opt/cinc-project/bin:/opt/cinc-project/embedded/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin

umask 022

export GEM_PATH=/opt/cinc-project/embedded/service/gem/ruby/3.1.0
export GEM_HOME=/opt/cinc-project/embedded/service/gem/ruby/3.1.0

exec veil-env-helper --use-file -f /etc/cinc-project/private-cinc-secrets.json -s bookshelf.access_key_id -s bookshelf.secret_access_key -o bookshelf.sql_password -- env ERL_EPMD_ADDRESS=0.0.0.0 HOME=/var/opt/cinc-project/bookshelf /opt/cinc-project/embedded/service/bookshelf/bin/bookshelf foreground