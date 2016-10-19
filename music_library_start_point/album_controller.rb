require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative './models/album'

# index
get ('/albums') do
    @albums = Album.all()
    erb(:'album/index')
end

# new
get ('/albums/new') do
    erb(:'album/new')
end

#create
post ('/albums') do
    @album = Album.new(params)
       @album.save
       redirect ("/albums/#{@album.id}")
end

# show
get ('/albums/:id') do
    @album = Album.find(params[:id])
    @album_artist = @album.artist
    erb(:'album/show')
end

#edit
get('/albums/:id/edit') do
    @album=Album.find(params[:id])
    erb(:'album/update')
end

#update
put ('/albums/:id') do 
    @album = Album.new(params)
    @album.update(params)
    redirect ("/albums")
end

delete ('/albums/:id') do
    Album.destroy(params[:id])
    redirect to("/albums")
end