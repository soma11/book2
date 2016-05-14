class PurchaseRequest < ActiveRecord::Base
  UPDATABLE_ATTRS = %i(m_book_id request_user_id status)
  belongs_to :m_book
  belongs_to :user

  scope :by_user_book, ->user_id, m_book_id { where(request_user_id: user_id, m_book_id: m_book_id)}
end
