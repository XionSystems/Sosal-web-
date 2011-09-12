Sosal::Application.routes.draw do
    
    get 'sessions/new'
    
    resources :users do
        member do
            get :following, :followers
        end
    end
    
    resources :users do
        resources :abouts
    end
    
    resources :messages do
        resources :responses
    end
    
    resources :storages
    resources :bookmarks
    resources :storeaccounts
    resources :storeplans
    resources :password_resets
    resources :profiles
    resources :locations
    resources :relationships, :only => [:create, :destroy]
    resources :sessions
    
    resources :albums do
        resources :photos
    end 
    
    get '/portfolio/:id', :to => 'users#portfolio', :as => '/portfolio'
    
    match '/signup', :to => 'users#new'
    
    controller :pages do
        root :to => :home
        
        match '/goodby' => :goodby
        
        match '/welcome' => :welcome 
        
        match '/storage_info' => :storage_info
        
        match '/about' => :about
        
        match '/help' => :help
        
        match '/terms' => :terms
        
        match '/privacy' => :privacy
        
        match '/resources' => :resources
    end
    
    controller :sessions do
        match '/signin' => :new
        
        match '/signout' => :destroy
    end
end
