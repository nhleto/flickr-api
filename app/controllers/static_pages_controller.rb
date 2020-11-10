class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new ENV['FLICKR_KEY'], ENV['FLICKR_SECRET']

    return unless params[:search]

    if !params[:search][:user].empty?
      begin
        @user = flickr.people.getInfo(user_id: params[:search][:user])
        @photos = flickr.photos.search(user_id: @user.id)
      rescue Flickr::FailedResponse => e
        flash[:alert] = e.msg.to_s
        render 'index'
      end
    elsif !params[:search][:username].empty?
      begin
        @user = flickr.people.findByUsername(username: params[:search][:username])
        @photos = flickr.photos.search(user_id: @user.id)
      rescue Flickr::FailedResponse => e
        flash[:alert] = e.msg.to_s
        render 'index'
      end
    end
  end
end
