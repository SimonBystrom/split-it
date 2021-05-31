class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.string :tag
      t.string :title
      t.float :price
      t.date :paid_date
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.references :split, null: false, foreign_key: true

      t.timestamps
    end
  end
end
