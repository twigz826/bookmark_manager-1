# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

# The BookmarkManager class is the main class.
class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/save_link' do
    Bookmark.add(params[:save_link])
    redirect '/'
  end
end
