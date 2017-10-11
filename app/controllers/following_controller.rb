class FollowingController < ApplicationController
  def index
    @following = current_user.following
  end
end
