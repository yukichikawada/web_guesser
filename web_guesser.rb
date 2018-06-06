require 'sinatra'
require 'sinatra/reloader'

SECRET_NUM = rand(100)

def validate_guess(params)
  num = ""
  if params.nil?
    message = ""
  else
    message = check_guess(params.to_i)
    num = SECRET_NUM
  end
  [message, num]
end

def check_guess(guess)
  if SECRET_NUM < guess
    "Too high!"
  elsif SECRET_NUM > guess
    "Too low!"
  else
    "Great guess!"
  end
end

get '/' do
  num = ""
  guess = params['guess']
  message, num = validate_guess(guess)
  erb :index, :locals => {
    :num => num,
    :message => message
  }
end
