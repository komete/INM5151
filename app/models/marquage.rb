class Marquage < ActiveRecord::Base
  acts_as_predecessor

  belongs_to :work
  has_many :produits
end
