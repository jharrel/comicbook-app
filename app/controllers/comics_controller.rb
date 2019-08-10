class ComicsController < ApplicationController

  get '/comics' do
    @comics = Comic.all
    erb :'/comics/index'
  end

  get '/comics/new' do
    erb :'comics/new'
  end

  get '/comics/:id' do
    set_comic
      erb :'comics/show'
  end

  post '/comics' do
    comic = Comic.create(comic_params)
    redirect '/comics'
  end

  get '/comics/:id/edit' do
    set_comic
    erb :'comics/edit'
  end

  patch '/comics/:id' do
    set_comic
    @comic.update(comic_params)
    redirect "/comics/#{@comic.id}"
  end

  delete "/comics/:id" do
    set_comic
    @comic.destroy
    redirect "/comics"
  end

  private

    def set_comic
      @comic = Comic.find_by_id(params[:id])
    end

    def comic_params
      { title: params[:comic][:title], publisher: params[:comic][:publisher], issue: params[:comic][:issue] }
    end
end
