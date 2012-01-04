class Admin::StaticContentsController < ApplicationController  
  access_control do
      allow :admin, :supervisor
  end
  
  layout "inadmin"  
    
  def index
    
  end
end
