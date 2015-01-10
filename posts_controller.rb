class PostsController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group_id = @group.id
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "You've successfully submitted a post!"
      redirect_to group_path(@group)
    else
      flash[:alert] = @post.errors.full_messages.join(".  ")
      render "groups/show"
    end
  end


  private
  def post_params
    params.require(:post).permit(:body, :post_photo)
  end


end
