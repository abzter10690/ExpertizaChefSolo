
# Setting the path for home directory and granting privileges.
puts "==== Setting the path for home directory and granting privileges! ===="
directory "/home/#{node['user']['name']}/" do
  owner 	"#{node['user']['name']}"
  group 	"#{node['group']}"
  mode 		"#{node['expertiza_clone']['mode']}"
  action 	:create
end

# Cloning the expertiza repository
puts "==== Cloning the expertiza repository from github! ===="
git "/home/#{node['user']['name']}/#{node['app']}" do
  repository	"#{node['expertiza_clone']['github']}"
  reference		"master"                
  action		:sync                     
end
puts "==== Expertiza repository cloned successfully! ===="
