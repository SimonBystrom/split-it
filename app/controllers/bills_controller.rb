class BillsController < ApplicationController
  before_action :set_bill, only: [:update, :destroy]
  
  def new
    @split = Split.find(params[:split_id])
    @bill = Bill.new
    authorize @bill
  end


  def create
    @split = Split.find(params[:split_id])
    @bill = Bill.new(bills_params)
    @bill.user = current_user
    @bill.split = @split
    authorize @bill
    if @bill.save
      flash[:success] = "Bill successfully created"
      redirect_to split_path(@split)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
    authorize @bill
  end

  def bills_params
    params.require(:bill).permit(:tag, :title, :price, :paid_date, :comment)
  end
end
