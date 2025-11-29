Rails.application.routes.draw do
  root "transcriptions#new"
  get "/transcribe", to: "transcriptions#new"
  resources :transcriptions, only: [:create, :show]
end
