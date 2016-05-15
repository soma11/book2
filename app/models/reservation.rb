class Reservation < ActiveRecord::Base
  belongs_to :reserved_user, class_name: User.name
  belongs_to :product
end
