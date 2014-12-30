class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = "You've successfully created a group!"
      redirect_to @group
    else
      flash[:alert] = "Fail"
      render "new"
    end
  end

  def show
  end

  def update
    if @group.update(group_params)
      flash[:notice] = "You've successfully updated the group!"
      redirect_to @group
    else
      render "edit"
    end
  end

  def edit
  end

  def destroy
    @group.destroy
    flash[:notice] = "You've successfully deleted a group!"
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end

  def find_group
    @group = Group.find(params[:id])
  end

end
