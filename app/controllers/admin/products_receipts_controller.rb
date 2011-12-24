class Admin::ProductsReceiptsController < ApplicationController
  access_control do
      allow :admin
  end
  layout "inadmin"  
  before_filter :load_receipt  
  
  def index
    @products_receipts = @receipt.products_receipts.all
  end

  def show
    @products_receipt = @receipt.products_receipts.find(params[:id])
  end

  def new
    @products_receipt = @receipt.products_receipts.build
    @relprodutos = Product.all(:conditions => "active = true")
  end

  def create
    @products_receipt = @receipt.products_receipts.build(params[:products_receipt])
    if @products_receipt.amount > 1
      qtde = @products_receipt.amount
      qtde.times do
        @produtos = ProductsReceipt.new
        @produtos.product_id = @products_receipt.product_id
        @produtos.receipt_id = @products_receipt.receipt_id
        @produtos.amount = 1       
        @produtos.save
      end
    else
      @products_receipt.save
    end
    redirect_to admin_reseller_receipt_products_receipts_path(@reseller,@receipt), :notice => "Successfully created products receipt."
#    if @products_receipt.save
#      redirect_to admin_reseller_receipt_products_receipts_path(@reseller,@receipt), :notice => "Successfully created products receipt."
#    else
#      render :action => 'new'
#    end
  end


  def edit
    redirect_to admin_reseller_receipt_products_receipts_path(@reseller,@receipt)
  end

#  def update
#    @products_receipt = ProductsReceipt.find(params[:id])
#    if @products_receipt.update_attributes(params[:products_receipt])
#      redirect_to [:admin, @products_receipt], :notice  => "Successfully updated products receipt."
#    else
#      render :action => 'edit'
#    end
#  end

  def destroy
    @products_receipt = @receipt.products_receipts.find(params[:id])
    @products_receipt.destroy
    redirect_to admin_reseller_receipt_products_receipts_path(@reseller,@receipt), :notice => "Successfully destroyed products receipt."
  end
  
  def load_receipt
    @reseller = Reseller.find(params[:reseller_id])
    @receipt = Receipt.find(params[:receipt_id])
  end  
end
