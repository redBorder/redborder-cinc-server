Name: redborder-cinc-server
Version: %{__version}
Release: %{__release}%{?dist}
BuildArch: noarch
Summary: Redborder package containing Cinc Server (chef-server) files

License: AGPL 3.0
URL: https://github.com/redBorder/redborder-cinc-server
Source0: %{name}-%{version}.tar.gz

BuildRequires: systemd

Requires: bash cinc-server-core >= 15.10.127

# Same opscode-*.service units as redborder-chef-server. The switch from Chef Server to
# Cinc Server is done by the migration script (dnf swap), never by a plain "dnf upgrade".
Provides: redborder-chef-server = %{version}-%{release}
Conflicts: redborder-chef-server

%description
%{summary}

%prep
%setup -qn %{name}-%{version}

%build

%install
mkdir -p %{buildroot}/usr/lib/redborder/bin
install -D -m 0755 resources/bin/rb_postgresql_start.sh %{buildroot}/usr/lib/redborder/bin/rb_postgresql_start.sh
install -D -m 0755 resources/bin/rb_nginx_start.sh %{buildroot}/usr/lib/redborder/bin/rb_nginx_start.sh
install -D -m 0755 resources/bin/rb_bookshelf_start.sh %{buildroot}/usr/lib/redborder/bin/rb_bookshelf_start.sh
install -D -m 0755 resources/bin/rb_oc_bifrost_start.sh %{buildroot}/usr/lib/redborder/bin/rb_oc_bifrost_start.sh
install -D -m 0755 resources/bin/rb_oc_id_start.sh %{buildroot}/usr/lib/redborder/bin/rb_oc_id_start.sh
install -D -m 0755 resources/bin/rb_opscode-erchef_start.sh %{buildroot}/usr/lib/redborder/bin/rb_opscode-erchef_start.sh
install -D -m 0755 resources/bin/rb_redis_lb_start.sh %{buildroot}/usr/lib/redborder/bin/rb_redis_lb_start.sh
install -D -m 0755 resources/bin/rb_opensearch_start.sh %{buildroot}/usr/lib/redborder/bin/rb_opensearch_start.sh
install -D -m 0755 resources/bin/rb_cinc-server_start.sh %{buildroot}/usr/lib/redborder/bin/rb_cinc-server_start.sh
install -D -m 0644 resources/systemd/opscode-postgresql.service %{buildroot}/usr/lib/systemd/system/opscode-postgresql.service
install -D -m 0644 resources/systemd/opscode-nginx.service %{buildroot}/usr/lib/systemd/system/opscode-nginx.service
install -D -m 0644 resources/systemd/opscode-bookshelf.service %{buildroot}/usr/lib/systemd/system/opscode-bookshelf.service
install -D -m 0644 resources/systemd/opscode-oc_bifrost.service %{buildroot}/usr/lib/systemd/system/opscode-oc_bifrost.service
install -D -m 0644 resources/systemd/opscode-oc_id.service %{buildroot}/usr/lib/systemd/system/opscode-oc_id.service
install -D -m 0644 resources/systemd/opscode-erchef.service %{buildroot}/usr/lib/systemd/system/opscode-erchef.service
install -D -m 0644 resources/systemd/opscode-redis_lb.service %{buildroot}/usr/lib/systemd/system/opscode-redis_lb.service
install -D -m 0644 resources/systemd/opscode-opensearch.service %{buildroot}/usr/lib/systemd/system/opscode-opensearch.service

%files
%defattr(0755,root,root)
/usr/lib/redborder/bin/rb_postgresql_start.sh
/usr/lib/redborder/bin/rb_nginx_start.sh
/usr/lib/redborder/bin/rb_bookshelf_start.sh
/usr/lib/redborder/bin/rb_oc_bifrost_start.sh
/usr/lib/redborder/bin/rb_oc_id_start.sh
/usr/lib/redborder/bin/rb_opscode-erchef_start.sh
/usr/lib/redborder/bin/rb_redis_lb_start.sh
/usr/lib/redborder/bin/rb_opensearch_start.sh
/usr/lib/redborder/bin/rb_cinc-server_start.sh
%defattr(0644,root,root)
/usr/lib/systemd/system/opscode-postgresql.service
/usr/lib/systemd/system/opscode-nginx.service
/usr/lib/systemd/system/opscode-bookshelf.service
/usr/lib/systemd/system/opscode-oc_bifrost.service
/usr/lib/systemd/system/opscode-oc_id.service
/usr/lib/systemd/system/opscode-erchef.service
/usr/lib/systemd/system/opscode-redis_lb.service
/usr/lib/systemd/system/opscode-opensearch.service

%post
#%systemd_post opscode-postgresql.service
%systemd_post opscode-nginx.service
%systemd_post opscode-bookshelf.service
%systemd_post opscode-oc_bifrost.service
%systemd_post opscode-oc_id.service
%systemd_post opscode-erchef.service
%systemd_post opscode-redis_lb.service
%systemd_post opscode-opensearch.service

%changelog
* Wed Nov 25 2026 Miguel Negrón <manegron@redborder.com> 1.0.0
- First version: redborder-chef-server ported to Cinc Server 15.10.127
- Paths /opt/cinc-project, /etc/cinc-project and /var/opt/cinc-project, system user cinc
- Secrets in /etc/cinc-project/private-cinc-secrets.json, gems in ruby/3.1.0
