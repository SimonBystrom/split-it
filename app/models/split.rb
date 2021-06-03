class Split < ApplicationRecord
  belongs_to :payment_group
  has_many :bills

  validates :name, presence: true
end
