class PaymentGroupsController < ApplicationController
  def index
    @payment_groups = policy_scope(Payment_group)
    @payment_groups = PaymentGroup.all
  end

  def show
    @payment_group = PaymentGroup.find(params[:id])
    authorize @payment_group
    @splits = @payment_group.splits
    @users = @payment_group.users
  end

  def new
    authorize @payment_group
    @payment_group = PaymentGroup.new
  end

  def create
    authorize @payment_group
    @payment_group = PaymentGroup.new(payment_group_params)
    if @payment_group.save
      flash[:success] = "Payment Group successfully created"
      redirect_to @show
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    authorize @payment_group
    @payment_group = PaymentGroups.find(params[:id])
  end
end
