class Book < ActiveRecord::Base
  has_many :checkouts
  belongs_to :categories
end
