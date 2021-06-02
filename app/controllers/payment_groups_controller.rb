class PaymentGroupsController < ApplicationController
  before_action :set_payment_group, only: [:show, :edit, :update]
  
  def show
    @splits_active = @payment_group.splits.where(active: true).order(created_at: :desc)
    @splits_archived = @payment_group.splits.where(active: false).order(created_at: :desc)
    @users = @payment_group.users
  end

  def new
    @payment_group = PaymentGroup.new
    authorize @payment_group
  end

  def create
    @payment_group = PaymentGroup.new(payment_group_params)
    authorize @payment_group
    if @payment_group.save
      flash[:success] = "Payment Group successfully created"
      redirect_to @show
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def set_payment_group
    @payment_group = PaymentGroup.find(params[:id])
    authorize @payment_group
  end

  def payment_group_params
    params.require(:payment_group).permit(:name, :description)
  end
end
