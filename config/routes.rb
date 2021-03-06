MicroBoundaries::Application.routes.draw do

  # utility pages
  match "/refresh_photos" => "home#refresh_photos"

  # dynamic pages
  match "/microbe/:tag" => "microbe#show"
  match "/leaderboard" => "instagram_user#index"
  match "/user/:username" => "instagram_user#show"

  # info pages
  get "/start" => "home#start"
  get "/scoring" => "home#scoring"
  get "/about" => "home#about"

  get "/all" => "home#all_photos"
  root :to => "home#index"
  
end