class Revendas::DashboardController < ApplicationController
	before_filter :check_login
	
	def index
	  #CALCULA O PRIMEIRO
	  @Usuarios = ProductReceiptsUser.all(:group => :user_id)
	  @Primeiro = 0
	  @Counter = 0
	  @Posicao = 0
	  
	  @Usuarios.each do |u|
      @Counter = @Counter + 1
      
      @User = User.find(u.user_id)
      @TotalUser = @User.product_receipts_users.all.count
      
      if @TotalUser > @Primeiro
        @Primeiro = @TotalUser
      end
      
      @Posicao = @Counter if @User.id == current_user.id

    end
    
	  #CALCULA TOTAL DO USUARIO
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
      @check = ProductReceiptsUser.first(:conditions => ['products_receipt_id = ?', params[:p].to_i])
      
      if !@check
        @positivacao = ProductReceiptsUser.new
        @positivacao.user_id = current_user.id
        @positivacao.products_receipt_id = params[:p].to_i
        @positivacao.save
      end
      
      @TotalVendido = current_user.product_receipts_users.all.count
    end
  end
end
