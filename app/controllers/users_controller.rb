class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user_groups = @user.groups

    @post_arr = Array.new
    @user_groups.each do |group|
      group.posts.each do |post|
        @post_arr.unshift(post)
      end
    end
  end

  private

end
