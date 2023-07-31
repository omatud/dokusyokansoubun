class Admin::ReviewsController < ApplicationController

  def show
    @revirw=Review.find(params[:id])
  end
  
  def destroy
    @review =Review.find(params[:id])
    @review.update(review_params)
    redirect_to admin_review_path(@review.id)
  end  

  private

  def review_params

    params.require(:review).permit(:review_id, :title, :review, :author, :site)
  end
end
