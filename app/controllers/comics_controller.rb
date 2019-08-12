class ComicsController < ApplicationController
  use Rack::Flash

  get '/comics' do
    redirect_if_not_signed_in
    @comics = current_user.comics
    erb :'comics/index'
  end

  get '/comics/new' do
    redirect_if_not_signed_in
    erb :'comics/new'
  end

  get '/comics/:id' do
    redirect_if_not_signed_in
    set_comic
    erb :'comics/show'
  end

  post '/comics' do
    redirect_if_not_signed_in
    @comic = current_user.comics.build(comic_params) #params[:comic] from earlier lession 15:16 time stamp sinatra CRUD
    if @comic.save
      redirect '/comics'
    else
      @errors = @comic.errors.full_messages
      erb :'comics/new'
    end
  end

  get '/comics/:id/edit' do
    redirect_if_not_signed_in
    set_comic
    if @comic.user == current_user
      erb :'comics/edit'
    else
      flash[:notice] = "You are not authorized to do that."
      redirect '/'
    end
  end

  patch '/comics/:id' do
    redirect_if_not_signed_in
    set_comic
    if @comic.update(comic_params)
      redirect "/comics/#{@comic.id}"
    else
      @errors = @comic.errors.full_messages
      erb :'comics/edit'
    end
  end

  delete "/comics/:id" do
    redirect_if_not_signed_in
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
