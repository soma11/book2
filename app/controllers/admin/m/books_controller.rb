class Admin::M::BooksController < Admin::BaseController
  before_action :set_m_book, only: [:show, :edit, :update, :destroy]

  def index
    @m_books = ::M::Book.all
  end

  def show
  end

  def new
    @m_book = ::M::Book.new
  end

  def edit
  end

  def create
    @m_book = ::M::Book.new(m_book_params)
    if @m_book.save
      redirect_to [:admin, @m_book], notice: "Book was successfully created."
    else
      render :new
    end
  end

  def update
    if @m_book.update(m_book_params)
      redirect_to [:admin, @m_book], notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @m_book.destroy
    redirect_to admin_m_books_url, notice: "Book was successfully destroyed."
  end

  private
  def set_m_book
    @m_book = ::M::Book.find params[:id]
  end

  def m_book_params
    params.require(:m_book).permit(::M::Book::UPDATABLE_ATTRS)
  end
end
