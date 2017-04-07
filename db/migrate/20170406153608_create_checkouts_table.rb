class CreateCheckoutsTable < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.integer :book_id, null: false
      t.string :customer_name
      t.datetime :checked_out_at
    end
  end
end
