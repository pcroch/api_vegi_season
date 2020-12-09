Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :products
      get '*path', to: 'base#render_not_found'
    end
  end

  # namespace :api, defaults: { format: :json } do
  #   namespace :v1 do
  #     resources :restaurants, only: [ :index, :show, :update ]
  #   end
  # end
end
