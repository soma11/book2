class Recommend < ActiveRecord::Base
  include RecommendDecorator
  UPDATABLE_ATTRS = [:sender_id, :product_id, :receiver_id]
  belongs_to :sender, class_name: User.name
  belongs_to :product
  belongs_to :receiver, class_name: User.name

  def sender_name
    self.sender ? self.sender.name : ""
  end
end
