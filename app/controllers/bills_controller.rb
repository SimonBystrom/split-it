class BillsController < ApplicationController
  before_action :set_bill, only: [:update, :destroy]
  
  def new
    @bill = Bill.new
    authorize @bill
  end

  def create
    @bill = Bill.new(bills_params)
    authorize @bill
    if @bill.save
      flash[:success] = "Bill successfully created"
      redirect_to @bill
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
