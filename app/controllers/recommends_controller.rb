class RecommendsController < ApplicationController
  before_action :set_recommend, only: [:show, :edit, :update, :destroy]

  def index
    @recommends = ::Recommend.all
  end

  def show
  end

  def new
    @recommend = ::Recommend.new
  end

  def edit
  end

  def create
    @recommend = ::Recommend.new recommend_params
    if @recommend.save
      redirect_to @recommend, notice: "Recommend was successfully created."
    else
      render :new
    end
  end

  def update
    if @recommend.update recommend_params
      redirect_to @recommend, notice: "Recommend was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @recommend.destroy
    redirect_to recommends_url, notice: "Recommend was successfully destroyed."
  end

  private
  def set_recommend
    @recommend = ::Recommend.find params[:id]
  end

  def recommend_params
    params.require(:recommend).permit ::Recommend::UPDATABLE_ATTRS
  end
end
