module Admin
  class ProductsController < BaseController
    before_action :set_product, only: %i[ show edit update destroy ]
  
    # GET /products or /products.json
    def index
      @products = Product.all
    end
  
    # GET /products/1 or /products/1.json
    def show; end
  
    # GET /products/new
    def new
      @product = authorize Product.new
      @categories = Category.all
    rescue Pundit::NotAuthorizedError
      flash[:notice] =  'Antes de criar um produto, crie uma categoria.'
      redirect_to action: :index
    end
  
    # GET /products/1/edit
    def edit
      @categories = Category.all
    end
  
    # POST /products or /products.json
    def create
      @product = Product.new(product_params)
  
      respond_to do |format|
        if @product.save
          format.html { redirect_to admin_products_path, notice: "Product was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /products/1 or /products/1.json
    def update
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to admin_products_path, notice: "Product was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /products/1 or /products/1.json
    def destroy
      @product.destroy
  
      respond_to do |format|
        format.html { redirect_to admin_products_url, notice: "Product was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:product).permit(:name, :description, :price, :publish, :category_id, :image)
      end
  end
end
