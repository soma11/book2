class M::Book < ActiveRecord::Base
  UPDATABLE_ATTRS = [:name, :isbn]
  has_many :products
  has_many :purchase_requests

  validates :name, presence: true
  validates :isbn, presence: true

end
