require 'sinatra'
require 'sinatra/contrib/all'
require_relative 'album_controller'
require_relative 'artist_controller'

get ('/') do
    erb(:home)
end