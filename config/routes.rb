require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  get 'transactions/clientes'
  get "transactions/cliente/:id" => "transactions#cliente"
  get "transactions/prueba/:id" => "transactions#prueba"

  mount Sidekiq::Web, at: '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
