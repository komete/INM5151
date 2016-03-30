class CreateTronconRoutes < ActiveRecord::Migration
  def change
    create_table :troncon_routes do |t|
      t.string :vocation
      t.string :nb_chausse
      t.string :nb_voies
      t.string :etat
      t.string :acces
      t.string :res_vert
      t.string :sens
      t.string :res_europe
      t.string :num_route
      t.string :class_adm
      t.float :longueur
      t.references :point_repere_final
      t.references :point_repere_init

      t.timestamps null: false
    end
  end
end
