Personalwebsite::Application.routes.draw do 
  devise_for :admins, :skip => :registrations
  root 'posts#index'
  get 'manage' => 'manage#index' 

  get 'posts/category/:category' => 'posts#index', 
    constraints: { category: /programming|personal/ }
  get 'posts/tag/:tag' => 'posts#index'

  get 'resume' => 'resume#index'
  get 'contact' => 'contact#index'

  resources :posts do
    resources :comments
  end

  resources :tags, only: [:index, :new, :create, :destroy] 
end
