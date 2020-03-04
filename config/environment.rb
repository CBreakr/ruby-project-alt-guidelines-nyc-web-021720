require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_relative "../lib/states/state"
require_all 'app'
require_all 'lib'
# ActiveRecord::Base.logger.level = :warn

