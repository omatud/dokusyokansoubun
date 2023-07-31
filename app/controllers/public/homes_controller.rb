class Public::HomesController < ApplicationController

  def top
    @reviews = Review.all
    @review_last4 = Review.last(4)
  end
end
