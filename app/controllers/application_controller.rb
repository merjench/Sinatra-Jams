require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    @artist = Artist.all
    erb :index
  end

  get "/show/:id" do
    @artist = Artist.find(params[:id])
    erb :show
  end

  get "/artists/new" do
    erb :new
  end

  post '/artist' do
    @artist = params[:artist]
    @new_artist = Artist.create(@artist)
    redirect '/show/' + @new_artist.id.to_s
  #  redirect '/artist/#{new_artist}'
  end
end
