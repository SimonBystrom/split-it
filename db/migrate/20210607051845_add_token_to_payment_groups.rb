class AddTokenToPaymentGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :payment_groups, :token, :string, null: false
  end
end
