Rails.application.routes.draw do
  post 'api/authorize_transaction', to: 'api#authorize_transaction'
end
