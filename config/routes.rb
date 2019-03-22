Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'user/token' => 'user_token#create'
      get 'users/current' => 'users#current'
      resources 'topics', only: %i(index show update destroy create)
    end
  end
end
