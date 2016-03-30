class CreateTronconRoutes < ActiveRecord::Migration
  def change
    create_table :troncon_routes do |t|
      t.integer :id_rte500
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

      t.timestamps null: false
    end
  end
end
