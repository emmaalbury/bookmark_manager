require 'sinatra/base'
require './lib/bookmarks'

class BookmarkApp < Sinatra::Base

  get '/' do
    # p ENV
    erb :home
  end

  post '/bookmarks' do
    @bookmarks = Bookmarks.view_all
    erb :bookmarks
  end

  run! if app_file == $0
end
