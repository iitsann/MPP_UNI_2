class HomeController < ApplicationController
  def index
    @reddits = Reddit.all
  end
end
