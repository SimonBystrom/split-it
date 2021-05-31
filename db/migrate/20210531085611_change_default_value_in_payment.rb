class ChangeDefaultValueInPayment < ActiveRecord::Migration[6.1]
  def change_column_null :payment_groups, :name, false
  end
end
