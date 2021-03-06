Rails.application.routes.draw do
  
  get '/angular', to: 'static_pages#angular' # Hello World
  
  root 'static_pages#home'
  
  get  '/help',    to: 'static_pages#help', as: 'helf' #esse helf serve para usar no helf_path e helf_url
  
  get  '/about',   to: 'static_pages#about'
  
  get  '/contact', to: 'static_pages#contact'
  
  get '/signup', to: 'users#new'
  
  post '/signup', to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  post 'authenticate_user', to: 'authentication#authenticate_user'
  post 'authenticate_aluno', to: 'authentication#authenticate_aluno'

  get 'alterar_periodo', to: 'alunos#get_alterar_periodo'
  post 'alterar_periodo', to: 'alunos#alterar_periodo'

  resources :users
  resources :alunos do
    get 'edit_password', to: 'alunos#edit_password'
    patch 'update_password', to: 'alunos#update_password'
    resources :kits,              shallow: :true, except: [:index] do
      resource :download, only: [:show]
    end
  end
  resources :feeds, only: [:create, :index]
  resources :kit_types
  
  get '/kits', to: 'kits#index'

end