class Admin::ReceiptsController < Admin::BaseController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]

  def index
    @receipts = ::Receipt.all
  end

  def show
  end

  def new
    @receipt = ::Receipt.new
  end

  def edit
  end

  def create
    @receipt = ::Receipt.new receipt_params
    if @receipt.save
      redirect_to [:admin, @receipt], notice: 'Receipt was successfully created.'
    else
      render :new
    end
  end

  def update
    if @receipt.update receipt_params
      redirect_to [:admin, @receipt], notice: 'Receipt was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @receipt.destroy
    redirect_to admin_receipts_url, notice: 'Receipt was successfully destroyed.'
  end

  private
  def set_receipt
    @receipt = ::Receipt.find params[:id]
  end

  def receipt_params
    params.require(:receipt).permit(::Receipt::UPDATABLE_ATTRS)
  end
end
