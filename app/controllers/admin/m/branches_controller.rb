class Admin::M::BranchesController < Admin::BaseController
  before_action :set_m_branch, only: [:show, :edit, :update, :destroy]

  def index
    @m_branches = ::M::Branch.all
  end

  def show
  end

  def new
    @m_branch = ::M::Branch.new
  end

  def edit
  end

  def create
    @m_branch = ::M::Branch.new(m_branch_params)

    if @m_branch.save
      redirect_to [:admin, @m_branch], notice: "branch was successfully created."
    else
      render :new
    end
  end

  def update
    if @m_branch.update(m_branch_params)
      redirect_to [:admin, @m_branch], notice: "branch was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @m_branch.destroy
    redirect_to admin_m_branches_url, notice: "branch was successfully destroyed."
  end

  private
  def set_m_branch
    @m_branch = ::M::Branch.find(params[:id])
  end

  def m_branch_params
    params.require(:m_branch).permit(:name)
  end
end
