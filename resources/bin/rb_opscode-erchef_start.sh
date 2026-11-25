#!/bin/bash
exec 2>&1

umask 022

export PATH=/opt/cinc-project/bin:/opt/cinc-project/embedded/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin

export GEM_PATH=/opt/cinc-project/embedded/service/gem/ruby/3.1.0
export GEM_HOME=/opt/cinc-project/embedded/service/gem/ruby/3.1.0

exec veil-env-helper --use-file -f /etc/cinc-project/private-cinc-secrets.json -s chef-server.webui_pub_key -s opscode_erchef.sql_password -s bookshelf.access_key_id -s bookshelf.secret_access_key -s oc_bifrost.superuser_id -o data_collector.token -o ldap.bind_password -- env ERL_EPMD_ADDRESS=0.0.0.0 HOME=/var/opt/cinc-project/opscode-erchef /opt/cinc-project/embedded/service/opscode-erchef/bin/oc_erchef foreground

