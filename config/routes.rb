Rails.application.routes.draw do
    root to: 'events#index'
    mount Ckeditor::Engine => '/ckeditor'
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
    resources :events, except: [:destroy] do
      member do
        get 'send_email'
      end

      collection do
        get 'event_type/:event_type', to: 'events#index', as: 'filter', event_type: "/#{Settings.event.types.join('|')}/"
        get 'enroll_by_email', as: 'enroll_by_email'
      end

      resources :users do
        member do
          post 'enroll'
        end
      end
    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
