class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.int :poste
      t.string :codeEmploye
      t.int :idCompte
      t.string :telephone

      t.timestamps null: false
    end
  end
end
