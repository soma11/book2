class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]
  before_action :find_or_create_book, only: :create

  # GET /products
  # GET /products.json
  def index
    if params[:user_id]
      @products = Product.user_products user_id_params
    else
      @products = Product.all.includes [:m_book, :borrowing_histories, :reservations]
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def new
    @m_book = ::M::Book.new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Users product was successfully created.'
    else
      render :new
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(Product::UPDATABLE_ATTRS)
  end

  def user_id_params
    params[:user_id]
  end

  def find_or_create_book
    if params[:product][:m_book_id].blank?
      new_book = M::Book.find_or_create_by(params[:m_book].permit(::M::Book::UPDATABLE_ATTRS))
      params[:product][:m_book_id] = new_book.id if new_book.id
    end
  end
end
