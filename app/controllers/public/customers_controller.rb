class Public::CustomersController < ApplicationController
  
  before_action :authenticate_customer!, except: [:top]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer

    if @customer.update(customer_params)
       redirect_to customers_path(@customer.id)
    else
       render :edit
    end

  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw

    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path

  end

  def likes
    likes = Like.where(customer_id: current_customer.id).pluck(:review_id)
    @like_reviews = Review.where(id: likes).order(created_at: :desc)
  end

private
  def set_user
    @user = User.find(params[:id])
  end



  def customer_params
    params.require(:customer).permit(:email, :name)
  end
end
