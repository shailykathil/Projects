class ProjectsController < ApplicationController

  	before_action :authenticate_user!
  def index
  	
    # @member = Member.where(:user_id => current_user.id)
    # @member.each do |member|
    # @projects = Project.where(:id => member.project_id)
    # end
       if params[:search].present?
        @projects = Project.where('name LIKE ? OR description LIKE ? AND active = ? ', "%#{params[:search]}%","%#{params[:search]}%", true)
      
      elsif params[:category].present?
       	category=Category.find(params[:category])
       	@projects = category.projects.where('name LIKE ? OR description LIKE ? AND active = ? ', "%#{params[:category]}%","%#{params[:search]}%",true)
      else 
        @projects = Project.where(:active=>true)
     end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end
  def edit
  @project = Project.find(params[:id])
end

  def create

   @project = Project.new(project_params)
   @project.save
    redirect_to @project
  end

 def update
  @project = Project.find(params[:id])
 if @project.update(project_params)
    redirect_to @project
  else
    render 'edit'
  end
end

def destroy
  @project = Project.find(params[:id])
  @project.destroy
 
  redirect_to projects_path
end
private
 
 def project_params
    params.require(:project).permit(:name,:description,:document,:category_id,:status,:active)
  end
end