require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#устанавливаем БД
set :database, "sqlite3:barbershop.db"

#создаем модель 
class Client < ActiveRecord::Base
  #валидация
  validates :name, presence: true, length: { minimum: 3 }
  validates :phone, presence: true
  validates :datestamp, presence: true
  validates :color, presence: true
end

#создаем модель                     
class Barber < ActiveRecord::Base
end

before do 
  @barbers = Barber.all
end


get '/' do
  erb :index
end

get '/visit' do
  @c = Client.new
  erb :visit
end


post '/visit' do

#сохранение в БД продвинутым способом № 1
# Client.create params[:client] 

#сохранение в БД продвинутым способом № 2
@c = Client.new params[:client]

if @c.save
  erb "<h1>Спасибо, вы записаны</h1>"
else
  @error = @c.errors.full_messages.first
  erb :visit
end

  #сохранение в БД ламерским способом
#  @barber = params[:barber]
#  @username = params[:user_name]
#  @namber_phone = params[:namber_phone]
#  @data_time = params[:data_time]
#  @color = params[:color]

  #сохранение в БД ламерским способом
#  c = Client.new
#  c.name = @username
#  c.phone = @namber_phone
#  c.datestamp = @data_time
#  c.barber = @barber
#  c.color = @color
#  c.save

end

get '/barber/:id' do
  @barber = Barber.find params[:id]
  erb :barber
end
