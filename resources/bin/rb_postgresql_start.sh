#!/bin/bash
exec 2>&1
exec /opt/cinc-project/embedded/bin/postgres -D /var/opt/cinc-project/postgresql/13/data
