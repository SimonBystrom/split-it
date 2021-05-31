class BillsController < ApplicationController
  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bills_params)
    if @bill.save
      flash[:success] = "Bill successfully created"
      redirect_to @bill
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    if @bill.update(bills_params)
      flash[:success] = "Bill was successfully updated"
      redirect_to @bill
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    if @bill.destroy
      flash[:success] = 'Bill was successfully deleted.'
      redirect_to bills_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to bills_url
    end
  end

  private

  def bills_params
    params.require(:bill).permit(:tag, :title, :price, :paid_date, :comment)
  end
end
