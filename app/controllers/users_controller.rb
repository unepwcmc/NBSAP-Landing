class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])

    if @user.save
      render :layout => false
    else
      render :action => 'new', :layout => false
    end
  end
end
