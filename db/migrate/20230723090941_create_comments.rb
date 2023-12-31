class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :customer_id,    null: false
      t.integer :review_id,    null: false
      t.text  :comment,        null: false, default: ""

      t.timestamps null: false
    end
  end
end
