class Product < ActiveRecord::Base
  include ProductDecorator
  UPDATABLE_ATTRS = %i(m_book_id owner_id)
  belongs_to :m_book, class_name: M::Book.name
  belongs_to :owner, class_name: User
  has_many :borrowing_histories, dependent: :destroy
  has_many :reservations, dependent: :destroy

  scope :user_products, ->(user_id) {includes(:m_book, :borrowing_histories).where(owner_id: user_id)}

  def latest_borrowing_history
    borrowing_histories.last
  end

  def status
    history = latest_borrowing_history
    unless history.nil?
      history.returned_at.nil? ? :borrowed : :returned
    end
  end
end
