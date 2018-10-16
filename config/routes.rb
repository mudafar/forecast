Rails.application.routes.draw do
  root 'home#index'
  mount ActionCable.server, at: '/cable'

end
