class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      redirect_to root_url
    else
      flash[:danger] = "Fail!"
      render "static_pages/home"
    end
  end

  private
  def comment_params
    params.require(:comment).permit :comment, :entry_id
  end
end
