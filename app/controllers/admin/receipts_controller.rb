class Admin::ReceiptsController < ApplicationController
  access_control do
      allow :admin
  end
  layout "inadmin"  
  before_filter :load_reseller   
  def index
    @receipts = @reseller.receipts.all
  end

  def show
    @receipt = @reseller.receipts.find(params[:id])
  end

  def new
    @receipt = @reseller.receipts.build
  end

  def create
    @receipt = @reseller.receipts.build(params[:receipt])
    if @receipt.save
      redirect_to admin_reseller_receipt_path(@reseller, @receipt), :notice => "Successfully created receipt."
    else
      render :action => 'new'
    end
  end

  def edit
    @receipt = @reseller.receipts.find(params[:id])
  end

  def update
    @receipt = @reseller.receipts.find(params[:id])
    if @receipt.update_attributes(params[:receipt])
      redirect_to admin_reseller_receipt_path(@reseller, @receipt), :notice  => "Successfully updated receipt."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @receipt = @reseller.receipts.find(params[:id])
    @receipt.destroy
    redirect_to admin_reseller_receipts_path(@reseller), :notice => "Successfully destroyed receipt."
  end
  
  def load_reseller
    @reseller = Reseller.find(params[:reseller_id])
  end  
end
