class Work < ActiveRecord::Base
  validates :type, presence:true
  validates :description, presence:true
  validates :itervenant, presence:true
end
