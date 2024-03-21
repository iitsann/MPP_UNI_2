class HomeController < ApplicationController
  def index
    @reddits = Reddit.order(:topic).page params[:page]
  end
end
