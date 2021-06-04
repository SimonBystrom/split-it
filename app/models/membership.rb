class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :payment_group
end
