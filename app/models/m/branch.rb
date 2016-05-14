class M::Branch < ActiveRecord::Base
  UPDATABLE_ATTRS = [:name]
  has_many :products

  validates :name, presence: true
end
