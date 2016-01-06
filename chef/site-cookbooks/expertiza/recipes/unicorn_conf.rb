
#Installing the unicorn gem
puts "==== Installing the unicorn gem!  ===="
execute 'Install unicorn Gem' do
  cwd "#{node['config']['exp_path']}"
  command 'gem install unicorn'
end
puts "==== Unicorn gem installed successfully! ===="

# Setting the custom configuration for unicorn
puts "==== Setting the custom configuration for unicorn! ===="
template "#{node['config']['exp_path']}/config/unicorn.rb" do
  source "unicorn.rb.erb"
  mode '0755'
  owner 'root'
end
puts "==== Custom configuration for unicorn set successfully! ===="
