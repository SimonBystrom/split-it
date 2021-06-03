class BillsController < ApplicationController
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
    # FIX LOGIC -> SHOULDN'T BE ABLE TO CREATE WITHOUT A SPLIT
    if @bill.save
      flash[:success] = "Bill successfully created"
      redirect_to split_path(@split)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    @bill = Bill.find(params[:id])
    authorize @bill
    if @bill.update
      flash[:success] = "Bill was successfully updated"
      redirect_to @bill
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    @bill = Bill.find(params[:id])
    authorize @bill
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
