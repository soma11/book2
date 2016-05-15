class Admin::PurchaseRequestsController < ApplicationController
  before_action :set_purchase_request, only: [:show, :update]

  def index
    @purchase_requests = ::PurchaseRequest.all
  end

  def show
  end

  def update
    if @purchase_request.update purchase_request_params
      flash[:success] = "Successful"
    else
      flash[:error] = @purchase_request.errors.error_massage
    end
    respond_to do |format|
      format.json {render json: flash}
    end
  end

  private
  def set_purchase_request
    @purchase_request = ::PurchaseRequest.find params[:id]
  end

  def purchase_request_params
    params.require(:purchase_request).permit(::PurchaseRequest::UPDATABLE_ATTRS)
  end
end
