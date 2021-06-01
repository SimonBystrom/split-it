class PaymentGroupsController < ApplicationController
  def index
    @payment_groups = PaymentGroup.all
  end

  def show
    @payment_group = PaymentGroup.find(params[:id])
    authorize @payment_group
    @splits_active = policy_scope(Split).where(active: true).order(created_at: :desc)
    @splits_archived = policy_scope(Split).where(active: false).order(created_at: :desc)
    @users = @payment_group.users
  end

  def new
    @payment_group = PaymentGroup.new
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

  def update
    @payment_group = PaymentGroups.find(params[:id])
    authorize @payment_group
  end
end
