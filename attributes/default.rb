default[:varnish] = {
  :version         => 4.1,
  :base_rpm_uri    => "https://repo.varnish-cache.org/redhat/varnish-%{version}.el%{platform_version}.rpm",
  :flush_cache => [ :before ],
}

default[:varnish][:rpm_uri] = default[:varnish][:base_rpm_uri] % {
  :version          => node[:varnish][:version],
  :platform_version => node[:platform_version].to_i,
}
