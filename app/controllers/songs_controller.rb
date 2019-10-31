require 'rack-flash'

class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  # remember to clean this method up
  post '/songs' do
    @song = Song.find_or_create_by(params[:song])

    if !artist = Artist.find_by(params[:artist])
      artist = Artist.create(params[:artist])
    end
    params[:genres].each do |genre_id|
      @song.genres << Genre.find_by_id(genre_id)
    end

    @song.artist = artist
    if @song.save
      flash[:message] = "Successfully created song."
    else
      flash[:message] = "Failed to create new song!"
    end
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show' if @song
  end


  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit' if @song
  end


  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist.update(params[:artist])
    @song.update(genre_ids: params[:genres])
    flash[:message] = "Successfully updated song."
    erb :'songs/show' if @song
  end


end
