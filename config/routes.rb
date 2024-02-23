Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks, only: %i[new create]
  end

  delete "bookmarks/:id" , to: "bookmarks#destroy"
end
