class DeleteTotalFromSplits < ActiveRecord::Migration[6.1]
  def change
    remove_column :splits, :total
  end
end
