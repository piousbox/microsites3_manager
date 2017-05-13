
Microsites3Manager::Application.routes.draw do

  root 'welcome#home'

  devise_for :users, :controllers => {
    :sessions => "users/sessions",
    :registrations => 'users/registrations'
  }
  devise_scope :user do
    post 'sign_in', :to => 'users/sessions#create', :as => :session
  end

  resources :galleries

  resources :reports

  resources :tags

  resources :users

  namespace :manager do
    root :to => 'welcome#home'

    resources :cities do 
      resources :communities
      resources :events
      resources :features
      resources :galleries
      resources :newsitems
      resources :reports
      resources :users
      resources :venues
      resources :videos
    end

    get  'galleries_title',                 :to => 'galleries#index_title', :as => :galleries_title
    get  'galleries_thumb',                 :to => 'galleries#index_thumb', :as => :galleries_thumb
    get  'galleries_mini',                  :to => 'galleries#index_mini',  :as => :galleries_mini
    get  'galleries/j_show/:id',            :to => 'galleries#j_show',      :as => :j_gallery,        :defaults => { :format => :json }
    post 'galleries/:galleryname/multiadd', :to => 'photos#j_create',       :as => :photos_multiadd
    resources :galleries

    get 'photos/without_gallery', :to => 'photos#without_gallery', :as => :photos_without_gallery
    resources :photos
    # get 'photos/:id', :to => 'photos#show', :as => :photo
    # delete 'photos/:id', :to => 'photos#delete'
    
    # get 'reports', :to => 'reports#index', :as => :reports
    # post 'reports', :to => 'reports#create'
    get 'reports/without_site', :to => 'reports#index', :as => :reports_without_site, :site => false
    resources :reports
    
    get 'sites/:site_id/reports', :to => 'reports#index', :as => :site_reports
    get 'sites/trash', :to => 'sites#trash', :as => :sites_trash
    resources :sites do
      resources :newsitems
      resources :features
      resources :galleries
      resources :reports
      resources :vides
    end

    resources :tags do
      resources :features
      resources :newsitems

      resources :galleries
      resources :reports
      resources :videos
    end

    resources :users do
      resources :galleries
      resources :reports
      resources :videos
    end

    resources :venues do
    end

  end
  delete 'manager/sites/:site_id/newsitems/:newsitem_id', :to => 'manager/sites#newsitem_delete', :as => :manager_sites_newsitem
  # get 'manager/sites/:site_id/newsitems/:newsitem_id', :to => 'manager/sites#newsitem_show', :as => :manager_sites_newsitem

end
