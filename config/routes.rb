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
    
    resources :statuses
    resources :profiles
    resources :relationships, :only => [:create, :destroy]
    resources :sessions
    
    resources :albums do
        resources :photos
    end 
    
    get '/portfolio/:id', :to => 'users#portfolio', :as => '/portfolio'
    
    match 'signup', :to => 'users#new'
    
    controller :pages do
        root :to => :home
        
        match '/welcome' => :welcome 
        
        match '/about' => :about
        
        match '/terms' => :terms
        
        match '/privacy' => :privacy
        
        match '/resources' => :resources
    end
    
    controller :sessions do
        match '/signin' => :new
        
        match '/signout' => :destroy
    end
end
