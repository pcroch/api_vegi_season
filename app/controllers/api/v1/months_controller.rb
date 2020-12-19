# products_controller.rb

class Api::V1::MonthsController < Api::V1::BaseController
  before_action :get_month, only: [:show]

 # def index
  #   @months = Product.all
  #   render json: { months: @months, status: :success }
  # end

  def show
    render json: { product_month: @month, status: :success }
  end

  private

  def get_month
    @month = Product.where(months_available: params[:id])
    unless @month
      render_errors([{ code: '3', message: 'Month not found' }], :not_found)
    end
  end

  def month_params
    params.require(:month).permit(:name, :kind, :months_available)
  end

end
