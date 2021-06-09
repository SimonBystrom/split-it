class RemoveNullFalseFromPriceInBills < ActiveRecord::Migration[6.1]
  def change
    change_column_null :bills, :price, true
  end
end
