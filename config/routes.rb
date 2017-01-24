Moishe::Application.routes.draw do
  

  get "mhwebsite/index"
  # match '', to: 'welcome#index', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' && r.subdomain == "mintranet"}
  # match '', to: 'mhwow#index', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' && r.subdomain == "mhwow"}
  root :to => 'mhwebsite#index'
  # root :to => 'welcome#index' 
  # match '/mintranet' => 'welcome#index' 
  
  scope '/mintranet' do
    root :to => 'welcome#index'

    resources :receipts do
      get "approve"
      get "mhwow"
    end
    
    resources :program_photos do
      resources :programs  
    end

    resources :galleries do
      resources :photo
    end
  
    resources :photos, :only => [:index, :create, :destroy]
  
    resources :programs do
      resources :receipts
    end
    
    match '/host_center' => "hostcenter#index"
    resources :houses    
      #hostcenter
      get   '/host_center/my_programs' => 'hostcenter#my_programs'
      get   'host_center/programs_edit/:id' => 'hostcenter#programs_edit'
      
      get   'host_center/receipts_new' => 'hostcenter#receipts_new'
      post  'host_center/receipts_create' => 'hostcenter#receipts_create'
      get   'host_center/receipts' => 'hostcenter#receipts'
      get   "host_center/receipts_edit/:id" => "hostcenter#receipts_edit"
      post  'host_center/receipts_update' => 'hostcenter#receipts_update'
      post  'host_center/programs_create' => 'hostcenter#programs_create'
      get   'host_center/programs_new' => 'hostcenter#programs_new'
      get   'host_center/programs_destroy/:id' => 'hostcenter#programs_destroy'
      get   'host_center/programs_edit/:id' => 'hostcenter#programs_edit'
      
      match '/host_center/register_program' => "hostcenter#register_program"
      match '/host_center/scholarship_form' => "hostcenter#scholarship_form"
      match '/host_center/programs_update' => "hostcenter#programs_update"
    # end
  end


    get "/programs/:id/upload_photos" => "residents#photo_uploader"
    match "/upload_photos" => "residents#upload_photos"

  #mhwow
    match 'programs/mhwow', :to => 'programs#mhwow'
    
    match '/contact_us' => "mhwow#contact_us"
    match '/my_programs' => "residents#programs" 

  
    get "residents/index"
    get "residents/myinfo"

    post "residents/myinfosubmit"

    get "residents/contacts"
    get "residents/programs"
    get "residents/programs_new"
    put "residents/programs_create"
    get "residents/programs_edit"
    post "residents/programs_update"
    
    get "residents/receipts"
    get "residents/receipts_edit"
    get "residents/receipts_new"
    put "residents/receipts_create"
    post "residents/receipts_update"
    get "residents/budget"
    get "reports/index"

    get "grants/index"
    get "grants/new"
    put "grants/create"
    get "grants/edit"
    post "grants/update"
    get "grants/programs"

    get "rents/index"
    put "rents/submit"

    

    get "programs/index"
    get "programs/edit"
    post "programs/update"
    get "programs/new"
    put "programs/create"
    get 'programs/mhwow'
    match "programs/export_activity" => "programs#export_activity"
    post "approve_program" => "programs#_approve"
    post "update_status" => "programs#_update_status"


    match '/users/edit/:id', :to => 'users#edit'
    get "users/index"
    get "users/edit"
    post "users/update"
    get "users/new"
    put "users/create"
    get "/users", :action => "index", :controller => "users"
    get "galleries/show"      

#main moishe house site
  match '/press' => "mhwebsite#press"
  match '/faq' => "mhwebsite#faq"
  match '/houselist' => "mhwebsite#houselist"
  match '/learning' => "mhwebsite#learning"
  match '/apply' => "mhwebsite#apply"

  match '/houses' => "mhwebsite#houses"
  match '/houses/:id' => "mhwebsite#house", :as => "mh_house"
  #match '/mhwow' => "mhwebsite#mhwow"

#about menu
  match '/background' => "mhwebsite#background"
  match '/board' => "mhwebsite#board"
  match '/evaluation' => "mhwebsite#evaluation"
  match '/jobs' => 'mhwebsite#jobs'
  match '/mission' => 'mhwebsite#mission'
  match '/moishemonthly' => 'mhwebsite#moishe_monthly'
  match '/our_team' => 'mhwebsite#our_team'
  match '/quarterly' => 'mhwebsite#quarterly'
  match '/supporters' => 'mhwebsite#supporters'

#moishe house without walls
  # get "mhwow/index"
  # get "mhwow/new"
  # get "mhwow/edit"
  # get "mhwow/create"
  # get "mhwow/update"

#mintranet
  

  

  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
