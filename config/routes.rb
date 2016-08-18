Rails.application.routes.draw do
	root	"users#new"

	post	"sessions"			=> "sessions#create"
	delete	"sessions"			=> "sessions#destroy"

	post	"users"				=> "users#create"
	get 	"users/new"			=> "users#new"
	get 	"users/:id"			=> "users#show"
	delete	"users/:id"			=> "users#destroy"
	put		"users/:id"			=> "users#update"
	get		"users/:id/edit"	=> "users#edit"

	get		"futures"			=> "futures#index"

	get		"login"				=> "users#new"
	get		"logout"			=> "sessions#destroy"
	get		"register"			=> "users#new"
end

# sorted by http method
  # get		"futures"			=> "futures#index"
  # get		"login"				=> "users#new"
  # get		"logout"			=> "sessions#destroy"
  # get		"register"			=> "users#new"
  # get 	"users/new"			=> "users#new"
  # get 	"users/:id"			=> "users#show"
  # get		"users/:id/edit"	=> "users#edit"

  # post	"sessions"			=> "sessions#create"
  # post	"users"				=> "users#create"

  # put		"users/:id"			=> "users#update"

  # delete	"sessions"			=> "sessions#destroy"
  # delete	"users/:id"			=> "users#destroy"
