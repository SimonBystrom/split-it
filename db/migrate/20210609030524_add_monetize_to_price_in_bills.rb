class AddMonetizeToPriceInBills < ActiveRecord::Migration[6.1]
  def change
    add_monetize :bills, :price
  end
end
