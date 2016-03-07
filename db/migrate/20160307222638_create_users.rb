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

      t.timestamps null: false
    end
  end
end
