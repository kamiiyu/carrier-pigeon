Rails.application.routes.draw do
    root to: 'events#index'
    get '诺特', to: 'events#index'
    mount Ckeditor::Engine => '/ckeditor'
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
    resources :events, except: [:destroy]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
