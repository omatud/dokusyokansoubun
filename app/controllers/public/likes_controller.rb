class Public::LikesController < ApplicationController

  def create
     @review_like = Like.new(customer_id: current_customer.id, review_id: params[:review_id])
     pp @review_like
     @review_like.save!
     redirect_to review_path(params[:review_id]) 
  end

  def destroy
    @review_like = Like.find_by(customer_id: current_customer.id, review_id: params[:review_id])
    @review_like.destroy
    redirect_to review_path(params[:review_id])
  end
  private
  
  def like
   params.require(:like).permit(:customer_id,:review_id, :amount)
  end

end
