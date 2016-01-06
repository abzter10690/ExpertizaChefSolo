
# Installing packages for mysql client
puts "==== Installing packages for mysql client! ===="
package "debconf-utils"
package "libmysqlclient-dev"
package "mysql-client-5.5"
puts "==== Packages for mysql client installed successfully! ===="

execute 'echo mysql-server-5.5 mysql-server/root_password password #{node["mysql"]["password"]} | debconf-set-selections '
execute 'echo mysql-server-5.5 mysql-server/root_password_again password #{node["mysql"]["password"]} | debconf-set-selections '

# Installing mysql server
puts " ==== Installing the mysql server! ===="
bash 'env_test0' do
  code <<-EOF
    apt-get -y install mysql-server-5.5 
    echo $DEBIAN_FRONTEND  
  EOF
end
puts " ==== Mysql server installed succesfully! ===="

