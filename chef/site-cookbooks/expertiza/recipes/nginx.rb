package "nginx"

# Removing the default configuration file for nginx

default_path = "#{node['nginx']['default']}"
execute "rm -f #{default_path}" do
  only_if { File.exists?(default_path) }
end

# Initializing the nginx server
service "nginx" do
  supports [:status, :restart]
  action :start
end
puts "==== Nginx server initialized successfully! ===="

# Setting custom config for nginx
puts "==== Setting the custom configuration for the nginx server! ===="
template "#{node['nginx']['default_conf']}" do
  source "#{node['nginx']['default_file']}"
  mode "#{node['nginx']['mode']}"
  owner 'root'
end
puts "==== Custom configuration for the nginx server has been set successfully! ===="

