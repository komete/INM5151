class CreateMarquages < ActiveRecord::Migration
  def change
    create_table :marquages do |t|
      t.string :nom
      t.string :type
      t.string :couleur
      t.references :work, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :marquages, [:work_id, :created_at]
  end
end
