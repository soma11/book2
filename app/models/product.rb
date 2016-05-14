class Product < ActiveRecord::Base
  include ProductDecorator
  belongs_to :m_book, class_name: M::Book.name
end
