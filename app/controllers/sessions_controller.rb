class SessionsController < ApplicationController
  use Rack::Flash
  get '/signup' do
    erb :'sessions/signup'
  end

  post '/signup' do
    user = User.new(params)
    if user.save
      # log in user via cookie and browser
      session[:user_id] = user.id
      # Temporary message to be shown in thewelcome page
      flash[:notice] = "Successfully Signed In."
      redirect '/'
    else
      @errors = user.errors.full_messages
      erb :'sessions/signup'
    end
  end

  get '/login' do
    erb :'sessions/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Successfully Signed In."
      redirect '/'
    else
      @errors = user.errors.full_messages
      erb :'sessions/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
