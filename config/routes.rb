Cart::Application.routes.draw do

  resources :categories do 
    resources :products, :shallow=>true
  end
  root :to=>"categories#index"
end
