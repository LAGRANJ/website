Rails.application.routes.draw do

  get 'management/index', as: "management"

  get 'special_offers/index', as: "special_offers"
  get 'special_offers/show/:id', to:"special_offers#show", as: "special_offer"
  get 'mini_special_offers/index', as: "mini_special_offers"
  get 'mini_special_offers/show/:id', to:"mini_special_offers#show", as: "mini_special_offer"

  namespace :admin do
    get 'deposit_types/show'
  end

  namespace :admin do
    get 'deposit_types/edit'
  end

  namespace :admin do
    get '/news', to:"news#index", as: "newsitems"
    get '/news/new', to:"news#new", as: "newsitem_new"
    post '/news', to:"news#create", as: "newsitem_create" 
    get '/news/:id', to:"news#show", as: "newsitem_show"
    get '/news/:id/edit', to:"news#edit", as: "newsitem_edit"
    patch '/news/:id', to:"news#update", as: "newsitem_update"
    delete '/news/:id', to:"news#delete", as: "newsitem_delete"
    
    post '/garants/add_image', to:"garants#add_image", as: "garant_images"
    post '/garants/add_detail', to:"garants#add_detail", as: "garant_details"
    post '/garants/destroy_image/:id/:image_id', to:"garants#destroy_image", as: "destroy_garant_image"
    post '/garants/destroy_detail/:id/:detail_id', to:"garants#destroy_detail", as: "destroy_garant_detail"
    resources :cash_terminals
    resources :garants
    resources :deposit_types
    resources :credit_types
    resources :credit_types
    resources :special_offers
    resources :mini_special_offers
    resources :offices
    resources :managers
    root "offices#index"

  end

  get 'garant/index', as: "garants"
  get 'garant/:garantid', to: "garant#show", as: "garant_show"

  get 'posterminals/index', as: "posterminals"

  get 'cards/index', as: "cards"

  get 'internetbank/index', as: "internetbank"

  get 'corraccounts/index', as: "corraccounts"

  get 'bankdetails/index', as: "bankdetails" 

  get 'report/index', as: "reports"

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
      get '(:client_type)/international_transfers/', to: "international_transfers#index", defaults: {client_type: 1}, as: "international_transfers"
      get '(:client_type)/international_transfers/:typeid/', to: "international_transfers#show", defaults: {client_type: 1}, as: "international_transfer"
      post '(:client_type)/international_transfers/:typeid/commission_table', to: "international_transfers#commission_table", defaults: {client_type: 1}, as: "inter_commission_table"     
      post '(:client_type)/international_transfers/:typeid/calculate_commission_fee', to: "international_transfers#calculate_commission_fee", defaults: {client_type: 1}, as: "inter_calculate_commission_fee"  

      get '(:client_type)/local_transfers/', to: "local_transfers#index", defaults: {client_type: 1}, as: "local_transfers"

      get '(:client_type)/local_transfers/branch_transfers/', to: "local_transfers#show_branch_transfers", defaults: {client_type: 1}, as: "local_transfers_branch_transfers"
      post '(:client_type)/local_transfers/branch_transfers_commission_table', to: "local_transfers#branch_transfers_commission_table", defaults: {client_type: 1}, as: "branch_transfers_commission_table"     
      post '(:client_type)/local_transfers/branch_transfers_calculate_commission_fee', to: "local_transfers#branch_transfers_calculate_commission_fee", defaults: {client_type: 1}, as: "branch_transfers_calculate_commission_fee"  

      get '(:client_type)/local_transfers/cliring_gross/', to: "local_transfers#show_cliring_gross", defaults: {client_type: 1}, as: "local_transfers_cliring_gross"      
      post '(:client_type)/local_transfers/cliring_gross_calculate_commission_fee', to: "local_transfers#cliring_gross_calculate_commission_fee", defaults: {client_type: 1}, as: "cliring_gross_calculate_commission_fee"  

      get '(:client_type)/local_transfers/swift/', to: "local_transfers#show_swift", defaults: {client_type: 1}, as: "local_transfers_swift"
      post '(:client_type)/local_transfers/swift_calculate_commission_fee', to: "local_transfers#swift_calculate_commission_fee", defaults: {client_type: 1}, as: "swift_calculate_commission_fee"
    end

    get 'credit_types/(:client_type)', to: "credit_types#index", defaults: {client_type: 1}, as: "credit_purposes"
    get 'deposit_types/(:client_type)', to: "deposit_types#index", defaults: {client_type: 1}, as: "deposit_types"
    get 'transfer_types/(:client_type)', to: "transfer_types#index", defaults: {client_type: 1}, as: "transfer_types"
    get 'depository/(:client_type)', to: "depository#index", defaults: {client_type: 1}, as: "depository"

    post 'depository/(:client_type)/calculate_commission_fee', to: "depository#calculate_commission_fee", defaults: {client_type: 1}, as: "depository_calculate_commission_fee"
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
