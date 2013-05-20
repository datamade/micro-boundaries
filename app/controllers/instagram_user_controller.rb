class InstagramUserController < ApplicationController
  caches_action :index, :show

  def index # also leaderboard
    @users = InstagramUser.order("score DESC").all
  end

  def show
    @user = InstagramUser.where( "username = ?", params[:username] ).first

    @mapped_photos = InstagramPhoto.select("instagram_photos.*, instagram_users.username, microbes.tag")
                               .joins("JOIN instagram_users on instagram_users.id = instagram_photos.instagram_user_id")
                               .joins("JOIN microbes on microbes.id = instagram_photos.microbe_id")
                               .where( :instagram_user_id => @user.id )
    @recent_photos = @mapped_photos.order("created_time DESC").all
    @mapped_photos = ActiveSupport::JSON.encode(@mapped_photos.all)
  end

end
