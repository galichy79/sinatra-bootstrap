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
  # хеш
  hh = { :username => 'Введите имя',
         :phone => 'Введите телефон',
         :datetime => 'Введите дату и время'}
  
  
  # для каждой пары ключ-значение
  hh.each do |key, value|
    # если параметр пуст
    if params[key] == ''
      # переменной error присвоить value из хеша hh
      # (а value из хеша hh это сообщение об ошибке)
      # т.е. переменной error присвоить сообщение об ошибке.
      @error = hh[key]
      # вернуть представление visit
      return erb :visit
  end
  end

  erb "Хорошо,  #{@username}, тел. #{@phone}, время #{@datetime}, парикмахер #{@barber}, цвет #{@color}. Мы вас записали к парикмахеру #{@barber} на #{@datetime}."
end
