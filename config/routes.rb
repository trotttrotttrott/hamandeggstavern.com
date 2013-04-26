HamAndEggs::Application.routes.draw do

  root :to => 'public/home#index'

  scope :module => 'public' do
    resources :patrons, :only => [:create], :controller => 'home'
  end

  devise_for :admins

  namespace :admin do
    root :to => 'dashboard#index'
    resources :beers
    resources :events
    resources :integrations, :only => [:index]
    resources :patrons, :only => [:index]
  end

  namespace :web_hook do
    match :mail_chimp, :to => 'mail_chimp#receiver'
  end
end
