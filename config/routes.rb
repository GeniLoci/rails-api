Rails.application.routes.draw do
  resources :entries
  get '/lastimage', to: 'entries#last_image'
  get '/previmage', to: 'entries#prev_image'
  get '/thirdimage', to: 'entries#third_image'
end
