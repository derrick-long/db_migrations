class SeperateNamesReaderTable < ActiveRecord::Migration

  class Reader < ActiveRecord::Base
    has_many :checkouts
  end

  def up
    #so we want to add new columns
    add_column :readers, :first_name, :string
    add_column :readers, :last_name, :string
    #then find our name and split it up into first and last and add it to our
    Reader.all.each do |reader|
      names = reader.name.split
      reader.first_name = names[0]
      reader.last_name = names[1]
    end
    remove_column :readers, :name
    #remove old column
  end

  def down
    #add old columns
    add_column :readers, :name, :string
    #find first and last name and save that to our our old column
    Reader.all.each do |reader|
      name = ""
      name = reader.first_name + " " + reader.last_name
      reader.name = name
    end
    remove_column :readers, :first_name
    remove_column :readers, :last_name
  end
end
