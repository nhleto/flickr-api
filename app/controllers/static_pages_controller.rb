class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new ENV['FLICKR_KEY'], ENV['FLICKR_SECRET']

    if params[:search]
      if !params[:search][:user].empty?
        @user = flickr.people.getInfo(user_id: params[:search][:user])
        @photos = flickr.photos.search(user_id: @user.id)
      else
        flash[:alert] = 'Failure'
        redirect_to root_path
      end
    end
  end
end
