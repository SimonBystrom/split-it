class ChangeTableSplits < ActiveRecord::Migration[6.1]
  def change
      remove_column :splits, :split_ratio
      change_column :splits, :active, :boolean, null: false, default: true
  end
end
