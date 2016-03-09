class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.integer :poste
      t.string :codeEmploye
      t.integer :idCompte
      t.string :telephone
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :users, [:account_id, :created_at]
  end
end
