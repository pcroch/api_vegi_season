# products_controller.rb

class Api::V1::ProductsController < Api::V1::BaseController
  before_action :get_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
    render json: { products: @products, status: :success }
  end

  def show
    render json: { products: @product, status: :success }
    # , status: :success
  end

  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    else
      render_errors(@product.errors, :unprocessable_entity)
    end
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: :created
    else
      render_errors(@product.errors, :unprocessable_entity)
    end
  end

  def destroy
    if @product && @product.destroy
       render json: { message: 'Product successfully destroyed'}, status: :no_content
      # head :no_content

    else @product
      render_errors(@product.errors, :unprocessable_entity)
    end
  end

  private


  def get_product
    @product =  Product.find_by(id: params[:id])
    unless @product
      render_errors([{ code: '3', message: 'Product not found'}], :not_found)
    end
  end

    def product_params
    params.require(:product).permit(:name, :kind, :months_available)
  end

end
