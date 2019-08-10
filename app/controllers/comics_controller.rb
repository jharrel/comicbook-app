class ComicsController < ApplicationController

  get '/comics/new' do
    erb :'/comics/new'
  end

  post '/comics' do
    comic = Comic.create(title: params[:title], publisher: params[:publisher], issue: params[:issue])
    redirect '/'
  end
end
