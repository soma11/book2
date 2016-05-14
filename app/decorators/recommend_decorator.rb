module RecommendDecorator
  def sender_name
    self.sender ? self.sender.name : ""
  end
  def product_name
    self.product ? self.product.name : ""
  end
  def receiver_name
    self.receiver ? self.receiver.name : ""
  end
end
