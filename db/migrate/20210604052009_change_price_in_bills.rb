class ChangePriceInBills < ActiveRecord::Migration[6.1]
  def change
    change_column :bills, :price, :integer, null: false
  end
end
