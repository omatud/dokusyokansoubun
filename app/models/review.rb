class Review < ApplicationRecord
    has_many :review_tags
    has_many :tags, through: :review_tags
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :customer

    def liked_by?(customer)
    likes.exists?(customer_id: customer.id)
    end
end
