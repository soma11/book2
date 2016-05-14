class Receipt < ActiveRecord::Base
  include ReceiptDecorator
  UPDATABLE_ATTRS = [:name, :product_id, :image]
  def image= image
    if image.is_a? ActionDispatch::Http::UploadedFile
      self.image = image.read
      self.original_filename = image.original_filename
      self.content_type = image.content_type
    else
      super image
    end
  end
end
