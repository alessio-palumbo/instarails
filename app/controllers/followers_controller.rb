class FollowersController < ApplicationController
  def index
    @profile = current_user.profile
    @followers = current_user.followers
    
  end
end
