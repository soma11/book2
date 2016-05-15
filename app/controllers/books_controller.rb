class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @m_books = ::M::Book.all
  end
end
