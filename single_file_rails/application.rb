require 'rails'
require 'active_support/railtie'
require "action_controller/railtie"
require 'active_record'

class SingleFile < Rails::Application
  config.session_store :cookie_store, :key => '_session'
  config.secret_key_base = '7893aeb3427daf48502ba09ff695da9ceb3c27daf48b0bba09df'

  Rails.logger = Logger.new($stdout)
end

class UsersController < ActionController::Base
  def index
    @users = User.all

    render inline:
      "
        <h1>All Users</h1>
        <ul>
        <% @users.each do | user | %>
          <li><%= user.name %></li>
        <% end %>
        </ul>
      "
  end
end

def setup_db
  require 'sqlite3'

  db_file = File.join(File.dirname(__FILE__), 'test.sqlite3')
  db = SQLite3::Database.new( db_file )
  db.execute( "DROP TABLE users;" ) rescue nil # maybe it didn't exist!
  db.execute( "CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, email VARCHAR(100), name VARCHAR(100));" )
  db.execute( "INSERT INTO users VALUES(1, 'john@example.com', 'John Doe');" )
  db.execute( "INSERT INTO users VALUES(2, 'jane@example.com', 'Jane Smith');" )

  ActiveRecord::Base.establish_connection(:adapter  => 'sqlite3', :database => db_file)
end

class User < ActiveRecord::Base
end

setup_db

SingleFile.routes.draw do
  root to: 'users#index'
end
