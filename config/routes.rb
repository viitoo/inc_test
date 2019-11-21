require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  get 'api/clientes' => "api#clientes"

  get 'api/cliente/:id' => "api#cliente"

  get 'api/transacciones/:id' => "api#transacciones"
  get "api/cuenta/:id" => "api#cuenta"


  mount Sidekiq::Web, at: '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
