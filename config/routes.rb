Rails.application.routes.draw do
  get 'controller/auth'

	get 'signin', to: 'auth#signin_view', as: 'signin'
	post 'signin', to: 'auth#signin'

	get 'signup', to: 'auth#signup_view', as: 'signup'
	post 'signup', to: 'auth#signup'

	get 'profile', to: 'auth#profile', as: 'profile'

	resources :orders, only: [:create, :new, :show, :index]

	resources :products, only: [:index, :show]

	namespace :admin do
	  resources :products, only: [:new, :create, :update, :destroy, :edit]

	  resources :orders, only: [:show, :index] do
	  	member do
	  		post :approve
	  		post :decline
	  	end
	  end

	end
end
