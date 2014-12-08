Rails.application.routes.draw do

  resources :cabbooking
  resources :member
  resources :welcome
  resources :airlinebooking

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'member#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  match "/welcome/settingsUpdate" => "welcome#settingsUpdate", :via => :post, :as => :welcome_settingsUpdate
  
  match "/cabbooking/createCust" => "cabbooking#createCust", :via => :post, :as => :createCust_cab
  match "/cabbooking/delCust" => "cabbooking#delCust", :via => :post, :as => :delCust_cab
  match "/cabbooking/findCust" => "cabbooking#findCust", :via => :post, :as => :findCust_cab
  match "/cabbooking/findBook" => "cabbooking#findBook", :via => :post, :as => :findBook_cab
  match "/cabbooking/updateBook" => "cabbooking#updateBook", :via => :post, :as => :updateBook_cab
  match "/cabbooking/book" => "cabbooking#book", :via => :post, :as => :book_cab
  
  match "/airlinebooking/createCust" => "airlinebooking#createCust", :via => :post, :as => :createCust_airline
  match "/airlinebooking/delCust" => "airlinebooking#delCust", :via => :post, :as => :delCust_airline
  match "/airlinebooking/findCust" => "airlinebooking#findCust", :via => :post, :as => :findCust_airline
  match "/airlinebooking/findBook" => "airlinebooking#findBook", :via => :post, :as => :findBook_airline
  match "/airlinebooking/updateBook" => "airlinebooking#updateBook", :via => :post, :as => :updateBook_airline
  match "/airlinebooking/book" => "airlinebooking#book", :via => :post, :as => :book_airline
  match "/airlinebooking/addpaydetails" => "airlinebooking#addpaydetails", :via => :post, :as => :airline_addpaydetails
  

  match "/member/signupCreate" => "member#signupCreate", :via => :post, :as => :member_signupCreate
  match "/member/authenticate" => "member#authenticate", :via => :post, :as => :member_authenticate
  match "/member/logout" => "member#logout", :via => :post, :as => :member_logout

end
