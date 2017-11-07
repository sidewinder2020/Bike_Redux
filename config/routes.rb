Rails.application.routes.draw do
  root to: "home#index"

   get 'auth/:provider/callback', to: 'sessions#create'
   get 'auth/failure', to: redirect('/')
   get 'signout', to: 'sessions#destroy', as: 'signout'

   resources :sessions, only: [:create, :destroy]
   resources :home, only: [:show]
   resources :requests

   namespace :api do
     namespace :v1 do
       namespace :product do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "most_popular", to: "most_popular#index"
        get "product_comments", to: "product_comments#index"
        get "worst_performing_category", to: "worst_performing_category#show"
        get "number_in_inventory", to: "number_in_inventory#show"

       end

       namespace :sales do
         get "highest_grossing_regions", to: "highest_grossing_regions#index"
         get "top_business_salespeople", to: "top_business_salespeople#index"
         get "most_popular_salesreasons", to: "most_popular_salesreasons#index"
       end

       namespace :stores do
         get "salesytd", to: "salesytd#show"
         get "top_selling_products", to: "top_selling_products#index"
         get "territory", to: "territory#show"
         get "number_of_orders", to: "number_of_orders#show"
         get "total_of_all_orders", to: "total_of_all_orders#show"
       end
       resources :stores

     end
   end
end
