class Admin::ProductsController < ApplicationController
  access_control do
      allow :admin
      allow :supervisor, :to => [:index, :show, :new, :create , :edit, :update]      
  end
  layout "inadmin"  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new(:active => true)
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to [:admin, @product], :notice => "Successfully created product."
    else
      render :action => 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to [:admin, @product], :notice  => "Successfully updated product."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_url, :notice => "Successfully destroyed product."
  end
end
