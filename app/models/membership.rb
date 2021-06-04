class Membership < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :payment_group, dependent: :destroy
end
