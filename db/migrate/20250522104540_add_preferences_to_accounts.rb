class AddPreferencesToAccounts < ActiveRecord::Migration[8.0]
  def change
    add_column :accounts, :dark_mode, :boolean
    add_column :accounts, :currency, :string
  end
end
