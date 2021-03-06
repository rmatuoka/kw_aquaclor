KwAquaclor::Application.routes.draw do

  #Inicio do namespace Admin
  namespace(:admin){
    resources :static_contents
    resources(:resellers) do
      resources(:receipts) do
        resources :products_receipts
      end
    end
    resources :rank
    resources :products 
    resources :users do
      collection do
        get 'search'
      end
    end
    
    root :to => "static_contents#index"
  }
  #Final do namespace Admin
  
  resources :user_sessions
  resources :users
  resources :vantagens
  resources :password_resets
  
  resources :clorador
  resources :ph_clorador
  resources :onde_encontrar do
    collection do
      post 'resultados'
      get 'popula_cidades'
    end
  end
  resources :home

  namespace(:revendas) do
    resources :dashboard do
      collection do
        post 'busca'
        get 'positivar'
      end
    end
  	resources :users
    resources :cnpj    
  end

  match 'cadastro' => "revendas/users#new"
  match 'login' => 'user_sessions#new'  
  match 'logout' => 'user_sessions#destroy'	
	
  root :to => "home#index"
  	

  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
