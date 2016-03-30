class CreatePointReperes < ActiveRecord::Migration
  def change
    create_table :point_reperes do |t|
      t.string :latitude
      t.string :longitude
      t.string :projection

      t.timestamps null: false
    end
  end
end
