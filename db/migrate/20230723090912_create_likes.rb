class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|

      t.integer :review_id,    null: false, default: ""
      t.integer :customer_id,    null: false, default: ""


      t.timestamps null: false
    end
  end
end
