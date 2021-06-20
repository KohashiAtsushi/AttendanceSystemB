Rails.application.routes.draw do
  get 'approval/new'

  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'users/index_working', to: 'users#index_working'
  patch 'users/index_to_update', to: 'users#index_to_update'
  
  resources :users do
    collection {post :import}
    member do
      get 'edit_basic_info'
      get 'one_month_approval'
      get 'one_month_approval/update_all'
      get 'attendances_preview'
      patch 'update_basic_info'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month'
    end

    resources :attendances, only: :update
    resources :attendance_logs, only: :index
    resources :attendance_monthly_reports, only: [:create, :update]
  end

  resources :base_points
  
end