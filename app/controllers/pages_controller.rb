class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:splash]

  def home
    @splits = current_user.splits.where(active: true)
    @bill = Bill.new
    authorize @bill
  end

  def splash
  end
end
