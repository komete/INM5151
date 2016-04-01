class Work < ActiveRecord::Base
  belongs_to :troncon_route

  validates :type, presence:true
  validates :description, presence:true
  validates :intervenant, presence:true
end
