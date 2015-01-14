class MembersController < ApplicationController

  def create
    @member = Member.new
    @group = Group.find(params[:group_id])
    @member.user = current_user
    @member.group = @group
    if @member.save
      redirect_to group_path(@group), notice: "You've successfully joined this group!"
    else
      flash[:alert] = "Something went wrong! You failed to joined this group."
      redirect_to group_path(@group)
    end
  end


  def destroy
    @group = Group.find(params[:group_id])
    @member = Member.find_by(user_id: current_user.id)

    if current_user.groups.include?(@group)
      @member.destroy
      flash[:notice] = "You've successfully left the group!"
    else
      flash[:alert] = "You are not authorized to do this."
    end
    redirect_to group_path(@group)
  end

  private


end
