class Admin::ReviewsController < ApplicationController

  before_action :authenticate_admin!

  def show
    @review=Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_top_path
  end

  private

  def review_params

    params.require(:review).permit(:review_id, :title, :review, :author, :site)
  end
end
