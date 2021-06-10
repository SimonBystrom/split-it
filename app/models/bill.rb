class Bill < ApplicationRecord
  monetize :price_cents
  belongs_to :user
  belongs_to :split
  has_one_attached :photo
  validates :title, :price, :paid_date, presence: true
  validates :price, numericality: true
end
