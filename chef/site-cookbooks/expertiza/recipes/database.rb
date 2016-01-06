
#Renaming database.yml.example to database.yml
puts "==== Renaming database.yml.example to database.yml! ===="
execute 'rename database.yml' do
	cwd node['database']['config']
	command 'mv database.yml.example database.yml'
end
puts "==== database.yml.example renamed to database.yml! ===="

#Extracting scrubbed db
puts "==== Extracting scrubbed db! ===="
execute 'extract scrubbed db' do
  cwd '/home'
  command "tar -xvzf  /home/#{node['database']['scrubbed_db']}"
end
puts "==== Scrubbed db extracted successfully! ===="

#Importing scrubbed db
puts "==== Importing scrubbed db! ===="
execute 'import db' do
  cwd '/home/root/expertiza'
  command "mysql -uroot < #{node['database']['scrubbed_sql']}"
end
puts "==== Imported scrubbed db successfully! ===="

#Performing DB Migrate
puts "==== Performing DB Migrate! ===="
execute 'db migrate' do
  cwd '/home/root/expertiza'
  command 'rake db:migrate'
end
puts "==== DB migrated successfully! ===="

