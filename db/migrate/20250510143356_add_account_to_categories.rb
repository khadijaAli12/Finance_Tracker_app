class AddAccountToCategories < ActiveRecord::Migration[8.0]
  def change
    add_reference :categories, :account, null: true, foreign_key: true
  end
end
