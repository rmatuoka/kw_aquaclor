class Revendas::CnpjController < ApplicationController
	def index
	end
	
	def create
    @Revenda = Reseller.find_by_cpnj(params[:reseller])
    
    if @Revenda.count > 0
      #GRAVA O ID DA REVENDA
      session[:reseller_id] = @Revenda.id
      redirect_to cadastro_path
    else
      flash[:msg] = "Revenda inválida. Digite o CNPJ, APENAS os números."
      redirect_to revendas_cnpj_index_path
    end
  end
end
