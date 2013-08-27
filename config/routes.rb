PosUnisinos::Application.routes.draw do
  resources :users do
    resources :lends do
    	post "delete"
    end
  end
  
   root :to => 'users#index' 
end
