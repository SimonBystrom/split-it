class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @payment_groups = PaymentGroups.all
    @splits = current_user.splits
  end

  def splash
  end
end
