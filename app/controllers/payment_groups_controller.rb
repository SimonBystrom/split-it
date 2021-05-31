class PaymentGroupsController < ApplicationController
  def index
    @payment_groups = Payment_group.all
  end

  def show
    @payment_group = Payment_group.find(params[:id])
    @splits = @payment_group.splits
    @users = @payment_group.users
  end

  def new
    @payment_group = Payment_group.new
  end

  def create
    @payment_group = Payment_group.new(payment_group_params)
    if @payment_group.save
      flash[:success] = "Payment Group successfully created"
      redirect_to @show
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    @payment_group = Payment_groups.find(params[:id])
  end
end
