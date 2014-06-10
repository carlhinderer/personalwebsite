Personalwebsite::Application.routes.draw do 
  devise_for :admins, :skip => :registrations
  root 'posts#index'
  get 'manage' => 'manage#index' 

  get 'posts/category/:category_or_tag' => 'posts#index'
  get 'posts/tag/:category_or_tag' => 'posts#index'

  resources :posts do
    resources :comments
  end

  resources :tags, only: [:index, :new, :create, :destroy] 
end
