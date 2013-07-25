require 'active_record'
require './setup'

task :db_drop do
  File.delete('db.sqlite3') if File.exists?('db.sqlite3')
end

task :db_create do
  load 'setup.rb'
end

task :db_migrate do
	sql = File.open('createSchema.sql').read
	sql.split(';').each { |i| ActiveRecord::Base.connection.execute(i) }
end

task :db_seed do
  load 'worker.rb'
  load 'work_order.rb'
  load 'seed.rb'  
end

task :db_seed => [:db_drop, :db_create, :db_migrate]
task :default => :db_seed