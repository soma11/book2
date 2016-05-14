class ReceiptImagesController < ApplicationController
  def show
    receipt = Receipt.find(params[:id])
    send_data receipt.image, type: receipt.content_type, disposition: :inline
  end
end
