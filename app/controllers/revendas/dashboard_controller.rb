class Revendas::DashboardController < ApplicationController
	before_filter :check_login
	
def index
  @Count = 0
  @Posicao = 0
  @TotalVendido = 0
  @resellers = ProductReceiptsUser.find(:all,
                                        :select=> "`product_receipts_users`.`user_id`, count(`product_receipts_users`.`products_receipt_id`) as `totalvendas`",
                                        :group => :user_id,
                                        :order=> " `totalvendas` desc, `product_receipts_users`.`user_id` ")
  if @resellers.count > 0
    @Rank = true
    if @resellers.first.user_id == current_user.id
      @Posicao = 1
      @Primeiro = @resellers.first.totalvendas
    else
      @Primeiro = @resellers.first.totalvendas
      @resellers.each do |u|
        @Count = @Count + 1
        if u.user_id == current_user.id
          @Posicao = @Count
          @TotalVendido = u.totalvendas
        end
      end 
    end
  else
    @Rank = false
  end
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
