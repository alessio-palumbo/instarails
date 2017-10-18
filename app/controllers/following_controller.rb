class FollowingController < ApplicationController
  def index
    @profile = current_user.profile
    @following = current_user.following
  end
end
