class Work < ActiveRecord::Base
  belongs_to :id_travaux, :class_name => "TronconRoute"

  validates :type, presence:true
  validates :description, presence:true
  validates :intervenant, presence:true
end
