class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user_groups = @user.groups
    @user_posts = @user.posts
  end

  private

end
