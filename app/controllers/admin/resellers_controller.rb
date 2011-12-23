class Admin::ResellersController < ApplicationController
  access_control do
      allow :admin
  end
  layout "inadmin"      
  def index
    @resellers = Reseller.all
  end

  def show
    @reseller = Reseller.find(params[:id])
  end

  def new
    @reseller = Reseller.new
  end

  def create
    @reseller = Reseller.new(params[:reseller])
    if @reseller.save
      redirect_to [:admin, @reseller], :notice => "Successfully created reseller."
    else
      render :action => 'new'
    end
  end

  def edit
    @reseller = Reseller.find(params[:id])
  end

  def update
    @reseller = Reseller.find(params[:id])
    if @reseller.update_attributes(params[:reseller])
      redirect_to [:admin, @reseller], :notice  => "Successfully updated reseller."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @reseller = Reseller.find(params[:id])
    @reseller.destroy
    redirect_to admin_resellers_url, :notice => "Successfully destroyed reseller."
  end
end
