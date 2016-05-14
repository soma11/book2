class M::Book < ActiveRecord::Base
  UPDATABLE_ATTRS = [:name, :isbn]
  has_many :product

  validates :name, presence: true
  validates :isbn, presence: true

end
