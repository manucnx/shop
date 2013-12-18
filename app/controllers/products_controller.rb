class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
    

  # GET /products
  # GET /products.json
  def index
    @product = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json  
    # def create
     #@product = Product.new(params[:product])

    #respond_to do |format|
      #if @product.save
       # format.html { redirect_to @product, notice: 'views.product.flash_messages.product_was_successfully_created' }
       # format.json { render action: 'show', status: :created, location: @product }
     # else
        #format.html { render action: 'new' }
       # format.json { render json: @product.errors, status: :unprocessable_entity }
    # end
    #end
  #end
  
   def create
     @product = Product.new(product_params)
     
     respond_to do |format|
       if @product.save
         format.html { redirect_to products_path, notice: I18n.t('views.product.flash_messages.product_was_successfully_created') }
         format.json { render action: 'show', status: :created, location: @product }
       else
         format.html { render action: "new" }
         format.json { render json: @product.errors, status: :unprocessable_entity }
       end
     end
   end 
   

  
 #def create
   #@product = Product.new(product_params)
   #if @product.save
    #redirect_to products_path(@product), notice: I18n.t('views.product.flash_messages.product_was_successfully_created')
    #else
    #render :new, alert: 'Failed'
    #end
  #end

#private

#def product_params
  #params.require(:product).permit(:name, :description, :price)
#end
  

  # PUT /products/1
  # PUT /products/1.json
  def update

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: I18n.t('views.product.flash_messages.product_was_successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
  private
   def set_product
    @product = Product.find(params[:id])
  end
   def product_params
     params.require(:product).permit(:name, :description, :price)
   end
end
