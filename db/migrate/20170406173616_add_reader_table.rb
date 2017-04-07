class AddReaderTable < ActiveRecord::Migration
  def change
    create_table :readers do |t|
      t.string :name, null: false
      t.string :email
      t.integer :phone_number
    end
  end
end
