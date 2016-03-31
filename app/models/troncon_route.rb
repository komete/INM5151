class TronconRoute < ActiveRecord::Base
  belongs_to :point_repere_init, :class_name => "PointRepere"
  belongs_to :point_repere_final, :class_name => "PointRepere"
  belongs_to :num_route, :class_name => "Route"
  has_many :works, :class_name => "Work", foreign_key: "id_travaux"

  validates :vocation, presence:true
  validates :nb_chausse, presence:true
  validates :nb_voies, presence:true
  validates :etat, presence:true
  validates :acces, presence:true
  validates :res_vert, presence:true
  validates :sens, presence:true
  VALID_NUM_REGEX = /\A[AND].+\z/i
  validates :num_route, presence: true, length: { maximum: 50 },
            format: { with: VALID_NUM_REGEX }
  validates :class_adm, presence:true
  validates :longueur, presence:true
end
