class AddResetAttributesToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :reset_digest, :string
    add_column :accounts, :reset_at, :datetime
  end
end
