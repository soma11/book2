class M::Book < ActiveRecord::Base
  UPDATABLE_ATTRS = [:name, :isbn]
end
