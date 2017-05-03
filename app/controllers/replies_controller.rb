class RepliesController < ApplicationController
	before_action do
    @comment = Comment.find(params[:comment_id])
  end

  def index
    @replies = @comment.replies
    @reply = @comment.replies.new
  end

  def new
    @reply = @comment.replies.new
  end

  def create
 
    @reply =  Reply.new(:body=>params[:reply][:body],:image=>params[:reply][:image],:comment_id=>params[:reply][:comment_id])
    @reply.save
    @replies= Reply.where(:comment_id=> params[:reply][:comment_id])
    flash[:notice]= "replies created"

     redirect_to "/projects/#{params[:project_id]}"
    #redirect somewhere
      # render 'projects/create_replies'
end
end
