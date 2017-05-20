class MembersController < ApplicationController
  def index
    @members = Member.all#Member.order(:yomi)
    #@members.sort
  end
  
  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(member_params)
    @member.save
    redirect_to members_path
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to members_path
  end
  
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to members_path
  end
  
  private
  def member_params
    params.require(:member).permit(:name, :yomi, :phone)
  end
end
