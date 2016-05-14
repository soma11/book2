module ReceiptDecorator
  def image_url
    "/receipt_images/#{self.id}"
  end
end
