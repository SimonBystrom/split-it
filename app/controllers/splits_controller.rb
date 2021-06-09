class SplitsController < ApplicationController
  before_action :set_split, only: [:show, :edit, :update, :destroy]

  def new
    @split = Split.new
  end

  def show
    @bills = @split.bills.order(created_at: :desc)
    authorize @split
  end

  def create
    @split = Split.new(splits_params)
    authorize @split
    @payment_group = PaymentGroup.find(params[:payment_group_id])
    @split.payment_group = @payment_group
    if @split.save
      flash[:success] = "Split successfully created"
      redirect_to @payment_group
    else
      flash[:error] = "Something went wrong"
    end
  end

  def update
    if @split.update(splits_params)
      authorize @split
      flash[:success] = "Split was successfully updated"
      redirect_to @split
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private

  def splits_params
    params.require(:split).permit(:name, :active)
  end

  def set_split
    @split = Split.find(params[:id])
    authorize @split
  end
end
