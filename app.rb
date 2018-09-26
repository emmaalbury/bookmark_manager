require 'sinatra/base'
require './lib/bookmarks'

class BookmarkApp < Sinatra::Base
  enable :sessions

  get '/' do
    # p ENV
    erb :home
  end

  # post '/bookmarks' do
  #   @bookmarks = Bookmarks.view_all
  #   erb :bookmarks
  # end
  post '/bookmarks' do
    p params
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.view_all
    erb :bookmarks
  end

  post '/bookmarks/new' do
    session[:bookmarks] = Bookmark.create(params['url'])
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  # post '/bookmarks' do
  #   url = params['url']
  #   connection = PG.connect(dbname: 'bookmark_manager_test')
  #   connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  #   redirect '/bookmarks'
  # end

  run! if app_file == $0
end
