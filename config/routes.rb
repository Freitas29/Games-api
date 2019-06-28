Rails.application.routes.draw do

  scope :api do
    scope :v1 do
      resources :games
      resources :genres
      resources :plataforms
    end
  end
end
