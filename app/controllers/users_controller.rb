class UsersController < ApplicationController
  def create
    # BIG HAX
    params[:user].each do |k, v|
      params[:user][k] = true if v == ["0", "1"]
    end

    @user = User.new(params[:user])

    if @user.save
      render :layout => false
    else
      render :action => 'new', :layout => false
    end
  end
end
