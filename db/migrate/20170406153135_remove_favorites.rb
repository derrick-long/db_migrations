class RemoveFavorites < ActiveRecord::Migration
  def change
    remove_column :books, :favorites
  end
end
