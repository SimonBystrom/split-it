class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :splash]

  def home
    @payment_groups = policy_scope(PaymentGroup)
    # For testing -> Will be current_user and change the :home to be required to authenticate
    @splits = User.first.splits.where(active: true)
  end

  def splash
  end
end
