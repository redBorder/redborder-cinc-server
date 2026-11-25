# redborder-cinc-server

Redborder RPM for Cinc Server (the Apache 2.0 build of Chef Infra Server). It replaces
`redborder-chef-server` and runs each Cinc Server service as a systemd unit instead of runit.

Differences with `redborder-chef-server`:

| | Chef Server 15.7 | Cinc Server 15.10 |
| --- | --- | --- |
| Install path | `/opt/opscode` | `/opt/cinc-project` |
| Config | `/etc/opscode/chef-server.rb` | `/etc/cinc-project/cinc-server.rb` |
| Data | `/var/opt/opscode` | `/var/opt/cinc-project` |
| Secrets | `/etc/opscode/private-chef-secrets.json` | `/etc/cinc-project/private-cinc-secrets.json` |
| System user | `opscode` | `cinc` |
| Service gems | `gem/ruby/2.7.0` | `gem/ruby/3.1.0` |

The unit names (`opscode-erchef.service`, `opscode-nginx.service`...) do not change: the
cookbooks, cgroups, checks and the WebUI use them.

It does not obsolete `redborder-chef-server`: the migration script switches packages with `dnf swap`.
