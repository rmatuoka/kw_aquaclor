class Revendas::DashboardController < ApplicationController
	def index
	  
	end
	
	def busca
    @nota = Receipt.first(:conditions => ['number = ?', params[:busca].to_i])
    
    if @nota
      @produtos = @nota.products_receipts.all
    end
  end
  
  def positivar
    
  end
end
