class AssociateReadersAndCheckouts < ActiveRecord::Migration
  class Checkout < ActiveRecord::Base
    belongs_to :reader
  end

  class Reader < ActiveRecord::Base
    has_many :checkouts
  end

  def up
    add_column :checkouts, :reader_id, :integer

    Checkout.all.each  do |checkout|
      reader_name = checkout.customer_name
      reader = Reader.find_or_create_by!(name: reader_name)
      checkout.reader = reader
      checkout.save!
    end
    remove_column :checkouts, :customer_name
  end

  def down
    add_column :checkouts, :customer_name, :string

    Checkout.all.each do |checkout|
      reader_id = checkout.reader_id
      reader = Reader.find(reader_id)
      checkout.customer_name = reader.name
      checkout.save!
    end
    remove_column :checkouts, :reader_id
  end
end
