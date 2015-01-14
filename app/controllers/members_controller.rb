class MembersController < ApplicationController
  before_action :authenticate_user!

  def create
    group = Group.find(params[:group_id])
    member = group.members.build
    member.user = current_user

    if member.save
      redirect_to group_path(group), notice: "You've successfully joined this group!"
    else
      flash[:alert] = "Something went wrong! You failed to joined this group."
      redirect_to group_path(group)
    end
  end

  def destroy
    member = current_user.members.find(params[:id])
    group = member.group

    if member.destroy
      flash[:notice] = "You've successfully left the group!"
    else
      flash[:alert] = "Sorry, could not leave the group at this time."
    end

    redirect_to group_path(group)
  end
end
