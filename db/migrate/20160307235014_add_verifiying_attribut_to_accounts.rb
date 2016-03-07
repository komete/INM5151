class AddVerifiyingAttributToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :verified, :boolean
  end
end
