class PostsController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    @post = @group.posts.build(post_params)
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group), notice: "You've successfully submitted a post!"
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
    @group = @post.group
    if @post.update(post_params)
      flash[:notice] = "You've successfully updated your post!"
      redirect_to @group
    else
      flash[:alert] = "Body cannot be blank"
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @group = @post.group
    if current_user.id == @post.user_id
      @post.destroy
      flash[:notice] = "You've successfully deleted a post!"
    else
      flash[:alert] = "You are not authorized to do this."
    end
    redirect_to group_path(@group)
  end


  private
  def post_params
    params.require(:post).permit(:body, :post_photo)
  end


end
