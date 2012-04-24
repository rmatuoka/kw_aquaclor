class Revendas::CnpjController < ApplicationController
  access_control do
      allow :admin
      allow :supervisor     
  end  
  @@Revendasid = 0
	def index
	end
	
	def create
   # @Revenda = Reseller.find_by_cpnj(params[:reseller])
   # @Revenda = Reseller.find_by_cnpj(:conditions => ["(active = true) and (cnpj = ?)", params[:reseller]], :limit=>"1")
   @Revenda = Reseller.find_by_cnpj(params[:reseller], :conditions => ["active = true"])
    if @Revenda
      #GRAVA O ID DA REVENDA
      $revenda_id = @Revenda.id
      redirect_to cadastro_path
    else
      flash[:msg] = "Revenda inválida ou não autorizada. Digite o CNPJ, APENAS os números."
      redirect_to revendas_cnpj_index_path
    end
  end
end
