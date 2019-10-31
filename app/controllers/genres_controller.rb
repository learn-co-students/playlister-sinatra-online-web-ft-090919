
class GenresController < ApplicationController

  get '/genres' do
    # present list of genres
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show' if @genre
  end

end
