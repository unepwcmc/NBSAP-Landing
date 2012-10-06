class StaticController < ApplicationController
  def landing
    @user = User.new
  end
end
