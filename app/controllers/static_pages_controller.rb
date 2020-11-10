class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new ENV['FLICKR_KEY'], ENV['FLICKR_SECRET']

    if params[:search]
      unless params[:search][:user].empty?
        begin
          @user = flickr.people.getInfo(user_id: params[:search][:user])
        rescue Flicker::FailedResponse
          flash[:alert].now = 'No User Found...'
        end
      end
    end

    

  end
end
