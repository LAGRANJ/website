Rails.application.routes.draw do
  get 'report/index'
  get 'report/show'

  get 'office/index', as: "offices"

  post 'office/show', as: "show_office_info"

  resources :users 

  post 'users/custom'

  namespace :products do
    namespace :credit_types do
      get 'credits(/:client_type(/:type_id))', to: "credits#index", defaults: {client_type: 1, type_id: 1}, as: "credits"
      get 'credits(/:client_type(/:type_id))/:product_id', to: "credits#show", defaults: {product_id: -1}, as: "creditdetails"
      post 'credits(/:client_type(/:type_id))/:product_id/calculate_rate_payment', to: "credits#calculate_rate_payment", defaults: {product_id: -1}, as: "calculate_rate_payment"
    end

    namespace :deposit_types do
      get 'deposits(/:client_type(/:type_id))', to: "deposits#index", defaults: {client_type: 1, type_id: 1}, as: "deposits"
      get 'deposits(/:client_type(/:type_id))/:product_id', to: "deposits#show", defaults: {product_id: -1}, as: "depositdetails"
      post 'deposits(/:client_type(/:type_id))/:product_id/calculate_rate_payment', to: "deposits#calculate_rate_payment", defaults: {product_id: -1}, as: "calculate_rate_payment"
    end

    namespace :transfer_types do 
      get '(:client_type/)international_transfers/', to: "international_transfers#index", defaults: {client_type: 1}, as: "international_transfers"
      get '(:client_type/)international_transfers/:typeid/', to: "international_transfers#show", defaults: {client_type: 1}, as: "international_transfer"
      post '(:client_type/)international_transfers/:typeid/commission_table', to: "international_transfers#commission_table", defaults: {client_type: 1}, as: "inter_commission_table"     
      post '(:client_type/)international_transfers/:typeid/calculate_commission_fee', to: "international_transfers#calculate_commission_fee", defaults: {client_type: 1}, as: "inter_calculate_commission_fee"  

      get '(:client_type/)local_transfers/', to: "local_transfers#index", defaults: {client_type: 1}, as: "local_transfers"
      get '(:client_type/)local_transfers/:typeid/', to: "local_transfers#show", defaults: {client_type: 1}, as: "local_transfer"
      post '(:client_type/)local_transfers/:typeid/commission_table', to: "local_transfers#commission_table", defaults: {client_type: 1}, as: "local_commission_table"     
      post '(:client_type/)local_transfers/:typeid/calculate_commission_fee', to: "local_transfers#calculate_commission_fee", defaults: {client_type: 1}, as: "local_calculate_commission_fee"  
    end

    get 'credit_types/(:client_type)', to: "credit_types#index", defaults: {client_type: 1}, as: "credit_purposes"
    get 'deposit_types/(:client_type)', to: "deposit_types#index", defaults: {client_type: 1}, as: "deposit_types"
    get 'transfer_types/(:client_type)', to: "transfer_types#index", defaults: {client_type: 1}, as: "transfer_types"
    
  end 


  get 'products/index'

  get 'credits(/:client_type(/:credit_type))', to: "credits#index", defaults: {client_type: 1, credit_type: 1}, as: "credits"

  get 'credits/show'

  get 'news/(:pageno)', to: "news#index", defaults: {pageno:1}, as: "news"
  get 'news/details/:id', to: "news#show", defaults: {:id=>1}, as: "news_details"


  get 'advice/index'

  get 'web_support/send_message'

  resources :rates

  root 'main#index'
  get 'main/index'

  resources :newsitems
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
