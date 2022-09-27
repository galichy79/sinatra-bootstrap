require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb 'Hello my white mister'
end

get '/about' do
  @error = 'something wrong!' 
  erb :about
end

get '/visit' do 
  erb :visit
end

get '/contacts' do 
  erb :contacts
end

post '/visit' do

  @username = params[:username]
  @phone = params[:phone]
  @datetime = params[:datetime]
  @barber = params[:barber]
  @color = params[:color]

  if @username == ''
    @error = 'Введите имя'
  
  end  

  if @phone == ''
    @error = 'Введите номер телефона'
   
  end

  if @datetime == ''
    @error = 'Неправильная дата и время'
  end

  if @error != ''
    return erb :visit
  end


  erb "Хорошо,  #{@username}, тел. #{@phone}, время #{@datetime}, парикмахер #{@barber}, цвет #{@color}. Мы вас записали к парикмахеру #{@barber} на #{@datetime}."
end
