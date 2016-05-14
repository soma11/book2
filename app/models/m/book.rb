class M::Book < ActiveRecord::Base
  UPDATABLE_ATTRS = [:name, :isbn]

  validates :name, presence: true
  validates :isbn, presence: true

end
