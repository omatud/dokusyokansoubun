class Public::CommentsController < ApplicationController

  def create
    comment = current_customer.comments.new(comment_params)
    comment.review_id = params[:review_id]
    comment.save
    redirect_to  review_path(params[:review_id])
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to review_path(params[:review_id])
  end

  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end  

end
