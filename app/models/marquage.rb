class Marquage < ActiveRecord::Base
  belongs_to :work
  has_many :produits

end
