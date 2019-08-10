class ComicsController < ApplicationController

  get '/comics' do
    @comics = Comic.all
    erb :'/comics/index'
  end

  get '/comics/new' do
    erb :'comics/new'
  end

  get '/comics/:id' do
    @comic = Comic.find_by_id(params[:id])
      erb :'comics/show'
  end

  post '/comics' do
    comic = Comic.create(params)
    redirect '/comics'
  end
end
