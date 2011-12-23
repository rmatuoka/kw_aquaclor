class Revendas::DashboardController < ApplicationController
	before_filter :check_login
	
	def index
	  #CALCULA O PRIMEIRO
	  @TotalVendido = current_user.product_receipts_users.all.count
	end
	
	def busca
    @nota = Receipt.first(:conditions => ['number = ?', params[:busca].to_i])
    
    if @nota
      @produtos = @nota.products_receipts.all
    end
  end
  
  def positivar
    !if !params[:p].blank?
      @check = ProductReceiptsUser.first(:conditions => ['user_id = ? AND products_receipt_id = ?',current_user.id, params[:p].to_i])
    
      if !@check
        @positivacao = ProductReceiptsUser.new
        @positivacao.user_id = current_user.id
        @positivacao.products_receipt_id = params[:p].to_i
        @positivacao.save
      end
    end
  end
end
