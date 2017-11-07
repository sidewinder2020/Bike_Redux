Rails.application.routes.draw do
  root to: "home#index"

   get 'auth/:provider/callback', to: 'sessions#create'
   get 'auth/failure', to: redirect('/')
   get 'signout', to: 'sessions#destroy', as: 'signout'
   get 'gross_analytics', to: 'gross_analytics#index', as: 'gross_analytics'
   get 'store_search', to: 'store_search#show', as: 'store_search'

   resources :sessions, only: [:create, :destroy]
   resources :home, only: [:show]
   resources :requests

   namespace :api do
     namespace :v1 do
       namespace :products do
        get "most_popular", to: "most_popular#index"
        get "product_comments", to: "product_comments#index"
        get "worst_performing_categories", to: "worst_performing_category#show"
        # get "number_in_inventory", to: "number_in_inventory#show"

       end

       namespace :sales do
         get "sales_per_region", to: "sales_per_region#index"
         get "top_business_salespeople", to: "top_business_salespeople#index"
         get "most_popular_salesreasons", to: "most_popular_salesreasons#index"
         get "difference_bt_this_year_last_year_sales", to: "difference_bt_this_year_last_year_sales#index"
       end

       namespace :stores do
         get "salesytd_per_store", to: "salesytd_per_store#show"
         get "top_selling_products", to: "top_selling_products#index"
         get "territory_area", to: "territory_area#show"
         get "number_of_orders", to: "number_of_orders#show"
         get "orders_total_cost", to: "orders_total_cost#show"
       end

     end
   end
end
