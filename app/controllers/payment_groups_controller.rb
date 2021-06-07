class PaymentGroupsController < ApplicationController
  include CloudinaryHelper
  require 'rqrcode'
  before_action :set_payment_group, only: [:show, :edit, :update, :join]

  def show
    @splits = @payment_group.splits.order(created_at: :desc)
    @users = @payment_group.users
    @image = set_banner_image
    @split = Split.new
  end

  
  def new
    @payment_group = PaymentGroup.new
    authorize @payment_group
  end
  
  def create
    @payment_group = PaymentGroup.new(payment_group_params)
    authorize @payment_group
    membership = Membership.new(user: current_user, payment_group: @payment_group)
    authorize membership
    
    if @payment_group.save && membership.save
      flash[:success] = "Payment Group successfully created"
      redirect_to payment_group_path(@payment_group)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def join
    membership = Membership.new(user: current_user, payment_group: @payment_group)
    authorize membership
    if membership.save
      flash[:success] = "Group joined successfully"
      redirect_to @payment_group
    else
      flash[:error] = "Something went wrong"
      redirect_to 'pages#home'
    end
  end

  private

  def generate_qr_code(group)
    qrcode = RQRCode::QRCode.new("#{ENV['BASE_URL']}/payment_groups/#{group}/join")
    @svg_code = qrcode.as_svg
  end

  def set_banner_image
    @payment_group.photo.key? ? cl_image_path(@payment_group.photo.key) : "#"
  end

  def set_payment_group
    @payment_group = PaymentGroup.find(params[:id])
    authorize @payment_group
  end

  def payment_group_params
    params.require(:payment_group).permit(:name, :description, :photo)
  end
end
