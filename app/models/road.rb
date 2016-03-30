class Road < ActiveRecord::Base
  has_many: :travaux

  validates :id_rte500,  presence: true, uniqueness: true
  validates :vocation, presence:true
  validates :nb_chausse, presence:true
  validates :nb_voies, presence:true
  validates :etat, presence:true
  validates :acces, presence:true
  validates :res_vert, presence:true
  validates :sens, presence:true
  VALID_EMAIL_REGEX = /\A[AND].+\z/i
  validates :num_route, presence: true, length: { maximum: 50 },
      format: { with: VALID_NUM_REGEX }
  validates :class_adm, presence:true
  validates :longueur, presence:true
end
