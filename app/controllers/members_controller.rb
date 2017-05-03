class MembersController < ApplicationController
def index
 @users = User.all
 @members=Member.all
end

def create
   @project = Project.find(params[:project_id])
   @member=@project.members.create(member_params)
   redirect_to projects_path(@project, @member)
     
end
def new
	@project = Project.find(params[:project_id])
    @member=Member.new 
end

 private

    def member_params
      params.require(:member).permit(:user_id, :project_id)
    end
end
