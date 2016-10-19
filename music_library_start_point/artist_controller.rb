require 'pry-byebug'
require_relative './models/artist'

# index
get ('/artists') do
    @artists = Artist.all()
    erb(:'artist/index')
end

# new
get ('/artists/new') do
    erb(:'artist/new')
end

#create
post ('/artists') do
    # post new artist data into the database
 @artist = Artist.new(params)
    @artist.save
    redirect ("/artists/#{@artist.id}")
end

# show
get ('/artists/:id') do
    @artist = Artist.find(params[:id])
    @albums = @artist.albums
    erb(:'artist/show')
end

#edit
get('/artists/:id/edit') do
    @artist=Artist.find(params[:id])
    erb(:'artist/update')
end

#update
put ('/artists/:id') do 
    @artist = Artist.new(params)
    @artist.update(params)
    redirect ("/artists")
end

delete ('/artists/:id') do
    Artist.destroy(params[:id])
    redirect to("/artists")
end

