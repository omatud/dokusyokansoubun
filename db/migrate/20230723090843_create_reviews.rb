class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :customer_id,    null: false, default: ""
      t.string  :author,         null: false, default: ""
      t.string  :title,          null: false, default: ""
      t.string  :site,           null: false, default: ""
      t.text    :review,         null: false, default: ""
      t.boolean :is_active,      null: false, default: "true"

      t.timestamps null: false
    end
  end
end
