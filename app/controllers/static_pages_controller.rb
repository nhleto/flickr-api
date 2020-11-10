class StaticPagesController < ApplicationController
  def index
    flickr = FlickRaw.new ENV['FLICKR_KEY'], ENV['FLICKR_SECRET']
    flickr.list
  end
end
