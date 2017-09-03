Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :destroy, :update]
  
  resources :c_boards do
      get 'inquiry', to: 'inquiry#c_board_index'
      post 'inquiry/confirm', to: 'inquiry#c_board_confirm'
      post 'inquiry/thanks', to: 'inquiry#c_board_thanks'
    end
    
  get 'inquiry', to: 'inquiry#index'
  post 'inquiry/confirm', to: 'inquiry#confirm'
  post 'inquiry/thanks', to: 'inquiry#thanks'

end
