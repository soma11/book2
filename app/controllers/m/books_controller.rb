class M::BooksController < ApplicationController

  def index
    @m_books = ::M::Book.all
  end

end
