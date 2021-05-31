class Split < ApplicationRecord
  belongs_to :payment_group
  has_many :bills
  
  validates :split_ratio, numericality: { in: 1..10 }
end
