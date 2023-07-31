class CreateReviewTags < ActiveRecord::Migration[6.1]
  def change
    create_table :review_tags do |t|

    t.integer :review_id,    null: false, default: ""
    t.integer :tag_id,    null: false, default: ""


      t.timestamps null: false
    end
  end
end
