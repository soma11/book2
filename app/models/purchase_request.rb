class PurchaseRequest < ActiveRecord::Base
  UPDATABLE_ATTRS = %i(m_book_id request_user_id status)
  belongs_to :m_book
  belongs_to :user
end
