class OndeEncontrarController < ApplicationController
  before_filter :load_states
  layout "application", :except => :popula_cidades
  
  def index
    
  end
  
  def load_states
    @Estados = Reseller.all(:group => "state", :order => "state ASC")
  end
  
  def resultados
    #flash[:msg] = params[:pessoa][:estado] + params[:pessoa][:cidade]
    @Resultados = Reseller.all(:conditions => ['state = ? AND city = ?', params[:pessoa][:estado], params[:pessoa][:cidade]])
    
    @retorno = ""
    
    @Resultados.each do |r|
      @retorno += "<div class=\"Name_corps\">"
      @retorno +=  "  		<img src=\"images/img_corp_detail_blue.png\" width=\"9\" height=\"64\" style=\"float:left;\" />"
      @retorno +=  "   	<span class=\"Title_1_corps\">#{r.name}</span><br />"
      @retorno +=  "       <span class=\"Text_label\"><label>Local:</label> #{r.city} / #{r.state}</span><br />"
      @retorno +=   "      <span class=\"Text_label\"><label>Bairro:</label> #{r.neibourhood}</span><br />"
      @retorno +=   "      <span class=\"Text_label\"><label>Telefone:</label> #{r.phone}</span>"
      @retorno +=   " 	</div>"
    end
  
  end

  def popula_cidades
    @Cidades = Reseller.all(:conditions => ['state = ?', params[:estado]], :group => "city", :order => "city ASC")
    
  end

end
