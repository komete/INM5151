class PointRepere < ActiveRecord::Base
  validates :latitude , presence:true
  validates :longitude , presence:true
  validates :projection , presence:true
end
