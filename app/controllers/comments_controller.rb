class CommentsController < ApplicationController
	def index
   @users = User.all
   @inquiries = Inquiry.all
   end

  def new
    @user = User.find_by(id: params[:user])
    @project = Project.find(params[:project_id])
    @comment = @project.inquiries.new
    @message = @comment.replies.build
  end
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.create!(comment_params)
    
     redirect_to project_path(@project)
     # render 'projects/create_comments'
  end

  def edit
    @project = Project.find(params[:project_id])
    @comment = @project.comments.find(params[:id])
  end

   def update
    @project = Project.find(params[:project_id])
    @comment = @project.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @comment = @project.comments.find(params[:id])
    @comment.destroy
    redirect_to project_path(@project)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body,:image)
    end
end
