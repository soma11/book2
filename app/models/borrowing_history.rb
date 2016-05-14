class BorrowingHistory < ActiveRecord::Base
  belongs_to :borrower, class_name: User.name
  belongs_to :product
end
