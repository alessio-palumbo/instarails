class LandingController < ApplicationController
  def index
    current_user && @profile = current_user.profile
  end
end
