class PageController < ApplicationController
  def home
    @videos = Video.all.includes(:video_views).order("video_views.views DESC")
  end
end
