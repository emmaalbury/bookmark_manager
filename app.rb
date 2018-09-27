require 'sinatra/base'
require './lib/bookmarks'
require 'sinatra/flash'

class BookmarkApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    # p ENV
    erb :home
  end

  # post '/bookmarks' do
  #   @bookmarks = Bookmarks.view_all
  #   erb :bookmarks
  # end
  post '/bookmarks' do
    if Bookmark.create(url: params['url'])
      redirect '/bookmarks'
    else
      flash[:notice] = 'Invalid URL. Please try again.'
      redirect '/bookmarks/new'
    end
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.view_all
    erb :bookmarks
  end

  post '/bookmarks/new' do
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end
  # post '/bookmarks' do
  #   url = params['url']
  #   connection = PG.connect(dbname: 'bookmark_manager_test')
  #   connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  #   redirect '/bookmarks'
  # end

  run! if app_file == $0
end
