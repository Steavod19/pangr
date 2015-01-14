class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @new_groups = Group.last(3)
    @groups = Group.all.sample(3)
    @posts = Post.all.sample(5)
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.managed_groups.build(group_params)
    if @group.save
      flash[:notice] = "You've successfully created a group!"
      redirect_to @group
    else
      flash[:alert] = "You've failed to created a group!"
      render "new"
    end
  end

  def show
    @group = Group.find(params[:id])
    @post_order = @group.posts.order(created_at: :desc).limit(20)
    @post = Post.new
    @member = Member.find_or_initialize_by(group: @group, user_id: current_user.id)

  end

  def update
    @group = current_user.managed_groups.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "You've successfully updated the group!"
      redirect_to @group
    else
      render "edit"
    end
  end

  def edit
    @group = current_user.managed_groups.find(params[:id])
  end

  def destroy
    @group = current_user.managed_groups.find(params[:id])
    @group.destroy
    flash[:notice] = "You've successfully deleted a group!"
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end

end
