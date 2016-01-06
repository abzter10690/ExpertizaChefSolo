
#Starting the unicorn server
puts "==== Starting the unicorn server! ===="
execute 'start unicorn' do
  cwd "#{node['server']['expertiza']}"
  command 'unicorn_rails -c config/unicorn.rb -D'
end
puts "==== Unicorn server started successfully! ===="

#Restarting the nginx server
puts "==== Restarting the nginx server! ===="
execute 'restart nginx' do
  cwd "#{node['server']['expertiza']}"
  command 'service nginx restart'
end
puts "==== Nginx server started successfully! ===="
