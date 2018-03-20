require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end


get '/' do
  @barbers = Barber.all
  erb :index
end

get '/visit' do
  erb :visit
end


post '/visit' do

  @barber = params[:barber]
  @username = params[:user_name]
  @namber_phone = params[:namber_phone]
  @data_time = params[:data_time]
  @color = params[:color]


  c = Client.new
  c.name = @username
  c.phone = @namber_phone
  c.datestamp = @data_time
  c.barber = @barber
  c.color = @color
  c.save


  erb "<h1>Спасибо, вы записаны</h1>"
end