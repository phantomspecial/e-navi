Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :users do
    resources :interviews do
      collection do
        get 'hrviewsindex'
        patch 'hrviewupdate'
        post 'newdatemailsender'
      end
    end
  end

end
