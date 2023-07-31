class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
    @tags = Tag.all
  end

  def create

    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.save!
    params[:review][:tag_ids].each do |tag_id|
      @review.review_tags.create(tag_id: tag_id)
    end
    redirect_to reviews_path

  end

  def update

    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.save!
    redirect_to reviews_path

  end

  def index
    if params[:keyword]
      # キーワード検索(あいまい検索で、LIKEで?の数だけ、keywordを渡す)
      # %は何かしらの文字列が含まれた場合でも対象とするという意味
      @reviews = Review.where('title LIKE ? OR author LIKE ? OR site LIKE ? OR review LIKE ?',
                                "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    elsif params[:tag_id]
      # タグのIDを取得して、ReviewTagからそのタグID一覧を取得し、Reviewに配列で渡して、データを出力する。
      @reviews = Review.where(id: ReviewTag.where(tag_id: Tag.find(params[:tag_id]).id).pluck(:review_id)).page(params[:page]).per(10)
    elsif params[:myreview]
      @reviews = Review.where(customer_id: current_customer.id).page(params[:page]).per(10)
    else
      @reviews = Review.all.page(params[:page]).per(10)
    end
  end

  def show
    @review = Review.find(params[:id])
    @comment = @review.comments.new
    @comments = Comment.all
  end

  def edit
    @review = Review.find(params[:id])
    if current_customer.id==@review.customer_id
      render :edit
    else
      redirect_to review_path
    end

    @tags = Tag.all
  end

  def destroy
    @review =Review.find(params[:id])
    @review.update(review_params)
    redirect_to review_path(@review.id)
  end

  def liked?(customer)
   likes.where(customer_id: customer.id).exists?
  end

  private

  def review_params
    params.require(:review).permit(:customer_id, :review, :site, :author, :title)
  end

end
