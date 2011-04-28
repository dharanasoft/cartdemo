Cart::Application.routes.draw do

  resources :categories do 
    resources :products
  end
  root :to=>"categories#index"
end
