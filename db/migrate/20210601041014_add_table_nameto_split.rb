class AddTableNametoSplit < ActiveRecord::Migration[6.1]
  def change
    add_column :splits, :name, :string, null: false
  end
end
