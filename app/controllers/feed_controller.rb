class FeedController < ApplicationController
  before_action :authenticate_user!

  def index
    # @photo_feed = current_user.photo_feed
    @profile = current_user.profile
    @profiles = Profile.where.not(user_id: @profile.user)
    @photos = Photo.all
  end
end
