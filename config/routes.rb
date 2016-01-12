Microsites2::Application.routes.draw do

  scope "/:locale", :constraints => { :locale => /en|ru|pt/ } do
    root :to => 'cities#index'

    # devise_for :users, :controllers => {
    #   :sessions => "users/sessions",
    #   :registrations => 'users/registrations'
    # }
 
    #
    # this is repeated un-scoped, hm...
    #
    get '/venues/show/:name_seo', :to => 'venues#show', :as => :venue
    get 'venues', :to => 'venues#index'
    #
    # get '/venues/show/:venuename/news', :to => 'venues#news', :as => :venue_news # @deprecated
    # get '/venues/show/:venuename/reports/show/:reportname', :to => 'venues#report', :as => :venue_report
    # get '/venues/show/:venuename/galleries/show/:galleryname', :to => 'venues#gallery', :as => :venue_gallery
    # resources :venues

    #
    # users
    #
    get 'users', :to => 'users#index'
    get 'users/show/:username', :to => 'users#show'
    
    #
    # cities
    #
    get 'cities', :to => 'cities#index', :as => :cities
    get 'cities/travel-to/:cityname', :to => 'cities#profile', :as => :city
    scope 'cities/travel-to/:cityname', :as => :city do
      get 'today', :to => 'cities#today', :as => :today

      get 'reports', :to => 'reports#index', :as => :reports
      get 'reports/page/:reports_page', :to => 'reports#index'

      get 'galleries', :to => 'galleries#index', :as => :galleries
      get 'galleries/page/:galleries_page', :to => 'galleries#index'

      get 'events', :to => 'events#index', :as => :events
      get 'events/page/:events_page', :to => 'events#index'

      get 'users', :to => 'users#index', :as => :users
      get 'users/page/:users_page', :to => 'users#index'

      get 'venues', :to => 'venues#index', :as => :venues
      get 'venues/page/:venues_page', :to => 'venues#index'
      get 'venue-type/:venue_type_name', :to => 'reports#index', :as => :venue_type

      # videos?
    end

    get 'reports/view/:name_seo', :to => 'reports#show', :as => :report
    get 'reports/show/:name_seo' => redirect { |request, params| "#{params[:locale]}/reports/view/#{params[:name_sep]}" }
    put '/reports/:id', :to => 'reports#update', :as => :update_report
    get 'reports', :to => 'reports#index', :as => :reports
    
    get 'galleries', :to => 'galleries#index', :as => :galleries
    # get 'galleries/show/:galleryname/:photo_idx', :to => redirect { |params, request|
    #   "http://piousbox.com/#{params[:locale]}/galleries/show/#{params[:galleryname]}/#{params[:photo_idx]}"
    # }, :constraints => { :format => /html/ }
    # get 'galleries/show/:galleryname', :to => redirect { |params, request|
    #   "http://piousbox.com/#{params[:locale]}/galleries/show/#{params[:galleryname]}/0"
    # }, :constraints => { :format => /html/ }
    # get 'galleries/view/:galleryname/:photo_idx', :to => redirect { |params, request|
    #   "http://piousbox.com/#{params[:locale]}/galleries/show/#{params[:galleryname]}/#{params[:photo_idx]}"
    # }, :constraints => { :format => /html/ }
    # get 'galleries/view/:galleryname', :to  => redirect { |params, request|
    #   "http://piousbox.com/#{params[:locale]}/galleries/show/#{params[:galleryname]}/0"
    # }, :constraints => { :format => /html/ }

    get 'galleries/view/:galleryname', :to => 'galleries#show' # , :constraints => { :format => /json/ }
    get 'galleries/view/:galleryname/:photo_idx', :to => 'galleries#show', :as => :gallery
    get 'galleries/show/:galleryname/:photo_idx', :to => 'galleries#show'
    get 'galleries/show/:galleryname', :to => 'galleries#show'
    # get 'galleries/:id/edit', :to => 'galleries#edit', :as => :edit_gallery
    # post 'galleries/:id', :to => 'galleries#update', :as => :update_gallery
    
    # get 'videos/in-city/:cityname', :to => 'videos#index', :as => :videos_in_city
    # get 'videos/view/:youtube_id', :to => 'videos#show', :as => :video
    # get 'videos/in-tag/:tagname', :to => 'videos#index', :as => :videos_in_tag
    # resources :videos
    
    # get 'set_locale', :to => 'welcome#set_locale', :as => :set_locale
    post 'set_city', :to => 'welcome#set_city', :as => :set_city

    # get 'events/in-city/:cityname', :to => 'events#index', :as => :events_in_city
    get 'events/show/:eventname', :to => 'events#show', :as => :event
    # resources :events
    
    get 'tags' => redirect { |params, r| "http://piousbox.com/en/tags" }
    get 'tags/view/:tagname' => redirect { |params, r| "http://piousbox.com/en/tags/view/#{params[:tagname]}" }

    get 'v', :to => 'utils/utils#version', :as => :version

    get 'sitemap', :to => 'utils/sitemaps#sitemap'

    # sites
    # get 'sites/:domainname/galleries.json', { 
    #   :to => 'sites#galleries', :as => :site_galleries, :format => :json, :constraints => { :domainname => /.*/, :format => /json/ } 
    # }
    # get 'sites/:domainname/newsitems.json', { 
    #   :to => 'sites#newsitems', :as => :site_newsitems, :format => :json, :constraints => { :domainname => /.*/, :format => /json/ } 
    # }
    # get "sites/:domainname.json", :to => "sites#show", :as => :site, :format => :json, :constraints => { :domainname => /.*/, :format => /json/ }

  end # end locale

  #
  # important non-locale-scoped stuff
  #
  get '/users/show/:username' => redirect { |params, request| "/en/users/show/#{params[:username]}" }
  get "/cities/travel-to/:cityname" => redirect { |params, request| "/en/cities/travel-to/#{params[:cityname]}" }
  get "/piousbox" => redirect { |params, request| "/en/users/show/piousbox" }
  get "/reports/view/:name_seo" => redirect { |params, request| "/en/reports/view/#{params[:name_seo]}" }
  # get "/galleries/show/:galleryname", :to => redirect { |params, request| 
  #   "http://piousbox.com/en/galleries/show/#{params[:galleryname]}/0" 
  # }, :constraints => { :format => /html/ }
  # get "/galleries/show/:galleryname/:number", :to => redirect { |params, request|
  #   "http://piousbox.com/en/galleries/show/#{params[:galleryname]}/#{params[:number]}" 
  # }, :constraints => { :format => /html/ }
  get '/cities', :to => 'cities#index'

end
