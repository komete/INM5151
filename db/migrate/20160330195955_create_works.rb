class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :type
      t.text :description
      t.datetime :debut, :null => false, :default => Time.now
      t.datetime :fin
      t.string :intervenant

      t.timestamps null: false
    end
  end
end
