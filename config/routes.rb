HamAndEggs::Application.routes.draw do

  root :to => 'public/home#index'

  scope :module => 'public' do
    resources :patrons, :only => [:create], :controller => 'home'
  end

  devise_for :admins

  namespace :admin do
    root :to => 'dashboard#index'
    resources :beers
    resources :patrons
  end
end
