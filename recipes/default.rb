package "epel-release"

execute "rpm --nosignature -i #{node[:varnish][:rpm_uri]}" do
  command "rpm --nosignature -i #{node[:varnish][:rpm_uri]}"
  not_if  'rpm -q varnish-release'
end

yum_package "varnish" do
  action      :install
  flush_cache node[:varnish][:flush_cache] unless node[:varnish][:flush_cache].nil?
end

service "varnish" do
  action   [ :enable, :start ]
end
