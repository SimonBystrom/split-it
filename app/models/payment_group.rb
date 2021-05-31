class PaymentGroup < ApplicationRecord
  has_many :splits
  has_many :users, through: :membership
end
