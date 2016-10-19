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
    erb(:'album/show')
end
