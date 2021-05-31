class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :split

  validates :title, :price, :paid_date, presence: true
end
