Rails.application.routes.draw do
  resources :tasks do
    member do
      patch :complete
      patch :incomplete  # เพิ่มเส้นทางนี้
    end
  end
  resources :categories  # ให้แน่ใจว่ามี resource นี้
end
