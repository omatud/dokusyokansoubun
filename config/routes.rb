Rails.application.routes.draw do

 root to: "public/homes#top"
   namespace :admin do
        resources :customers, only: [:index, :show, :edit, :update]
        resources :reviews, only: [:show, :destroy]
        resources :tags, only: [:index, :create,]
        get 'top'=>'homes#top'
   end
   scope module: :public do

        get 'customers/unsubscribe'=>'customers#unsubscribe'
        patch 'customers/withdraw'=>'customers#withdraw'
        resource :customers, only: [:show, :edit, :update] do
           # member do
             get 'likes' => 'customers#likes'
           # end
        end
        resources :reviews, only: [:new, :create, :index, :show, :update, :destroy] do

        resources :comments, only: [:create, :destroy]
        resource :likes, only: [:create, :destroy]
       end

   end



  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 以下を追加
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

end
