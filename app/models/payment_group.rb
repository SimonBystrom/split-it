class PaymentGroup < ApplicationRecord
  has_many :splits
  has_many :memberships
  has_many :users, through: :memberships
  has_one_attached :photo
  has_secure_token

  validates :description, length: {minimum:0, maximum:50}
end
