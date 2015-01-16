class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @group = current_user.groups.find(params[:group_id])
    @post = @group.posts.build(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "You've successfully submitted a post!"
      redirect_to group_path(@group)
    else
      flash[:alert] = @post.errors.full_messages.join(".  ")
      redirect_to group_path(@group)
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "You've successfully updated your post!"
      redirect_to @post.group
    else
      flash[:alert] = "Body cannot be blank"
      render 'edit'
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    group = post.group

    if post.destroy
      flash[:notice] = "You've successfully deleted a post!"
    else
      flash[:alert] = "Sorry, could not delete the post at this time."
    end

    redirect_to group_path(group)
  end

  private

  def post_params
    params.require(:post).permit(:body, :post_photo)
  end
end
