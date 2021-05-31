class CreateSplits < ActiveRecord::Migration[6.1]
  def change
    create_table :splits do |t|
      t.decimal :total, null: false
      t.boolean :active, null: false
      t.integer :split_ratio, null: false
      t.references :payment_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
