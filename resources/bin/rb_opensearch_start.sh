#!/bin/bash
exec 2>&1

ulimit -n 65536

export ES_HOME=/var/opt/cinc-project/opensearch            #/var/opt/cinc-project/elasticsearch
export ES_DATA=/var/opt/cinc-project/opensearch/data       #/var/opt/cinc-project/elasticsearch/data

export JAVA_HOME=/opt/cinc-project/embedded/open-jre/
export ES_PATH_CONF=/var/opt/cinc-project/opensearch/config
export PATH=/opt/cinc-project/embedded/bin:$JAVA_HOME/bin:$ES_HOME:$PATH #/opt/cinc-project/embedded/bin

export TMPDIR=/var/opt/cinc-project/opensearch/tmp
export ES_TMPDIR=/var/opt/cinc-project/opensearch/tmp

export GEM_PATH=/opt/cinc-project/embedded/service/gem/ruby/3.1.0
export GEM_HOME=/opt/cinc-project/embedded/service/gem/ruby/3.1.0

cd $ES_HOME

/opt/cinc-project/embedded/opensearch/bin/opensearch
