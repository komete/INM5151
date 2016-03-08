class AddVerifiyingAttributToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :verified_digest, :string
    add_column :accounts, :verified, :boolean, default: false
    add_column :accounts, :verified_at, :datetime
  end
end
