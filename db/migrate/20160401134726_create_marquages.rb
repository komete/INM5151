class CreateMarquages < ActiveRecord::Migration
  def self.up
    create_table :marquages do |t|
      t.integer :heir_id
      t.string :heir_type
      t.string :type_marquage
      t.string :couleur
      t.references :work, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :marquages, [:work_id, :created_at]
  end

  def self.down
    drop_table :marquages
  end
end
