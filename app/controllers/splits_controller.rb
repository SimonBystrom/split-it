class SplitsController < ApplicationController
  before_action :set_split, only: [:edit, :update, :destroy]

  def new
    @split = Split.new
  end

  def show
    @split = Split.find(params[:id])
    authorize @split
  end

  def create
    @split = Split.new(splits_params)
    authorize @split
    if @split.save
      flash[:success] = "Split successfully created"
      redirect_to @split
    else
      flash[:error] = "Something went wrong"
      render 'payment_groups/show'
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
    params.require(:split).permit(:total, :active, :split_ratio)
  end

  def set_split
    @split.find(params[:id])
    authorize @split
  end
end
