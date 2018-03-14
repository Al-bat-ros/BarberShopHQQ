require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :datebase, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end


get '/' do
  erb 'Can you handle'
end
