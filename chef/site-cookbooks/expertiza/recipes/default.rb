
#Updating System Packages.
puts "==== Updating system packages! ===="
execute "apt-get update"
puts "==== System packages updated successfully! ===="

#Installing Packages
puts "==== Installing dependency packages for Expertiza! ===="
package "telnet"
package "postfix"
package "curl"
package "git-core"
package "zlib1g-dev"
package "libssl-dev"
package "libreadline-dev"
package "libyaml-dev"
package "libsqlite3-dev"
package "sqlite3"
package "libxml2-dev"
package "libxslt1-dev"
package "build-essential"
package "tree"
package "ruby-full"
package "openjdk-6-jre-headless"
package "openjdk-6-source"
package "libmysqlclient-dev"
package "libaspell-dev"
package "libpq-dev"
package "bundler"
puts "==== Dependency packages for Expertiza installed succesfully! ===="

#Setting timezone for the system
puts "==== Setting timezone for the system! ===="
bash "set timezone" do
  code <<-EOH
    echo 'US/Eastern-New' > /etc/timezone
    dpkg-reconfigure -f noninteractive tzdata
  EOH
  not_if "date | grep -q 'EDT\|EST'"
end
puts "==== System timezone set successfully! ===="
