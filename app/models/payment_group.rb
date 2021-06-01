class PaymentGroup < ApplicationRecord
  has_many :splits

  has_many :memberships
  has_many :users, through: :memberships
  has_one_attached :photo
end
