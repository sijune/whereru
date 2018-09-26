Rails.application.routes.draw do
  # 쪽지
  get 'comments/index'
  get 'comments/userList'
  get 'comments/new/:id' => 'comments#new'
  post '/comments/create' => 'comments#create'
  get '/comments/recieve' => 'comments#recieve'
  get 'comments/show/:id' => 'comments#show'
  get 'comments/sent'
  get '/comments/destroy/:id' => 'comments#destroy'

  # 실시간 인기글
  get 'posts/hotPost'
  #icon test
  get '/posts/icon' => 'posts#icon'
  #알림 : 전체 삭제
  get '/new_notifications/read_all' => 'new_notifications#read_all'
  #알림
  resources :new_notifications

  post '/tinymce_assets' => 'tinymce_assets#create' #tinymce
  
  devise_for :users
  
  get '/posts/login' => 'posts#login'
  
  post 'replies/create'
  get 'replies/destroy/:id'=>'replies#destroy'  

  post 'rereplies/create'
  get 'rereplies/destroy/:id'=>'rereplies#destroy'  
  
  root 'posts#main'
  
  # C 만들기
  get '/posts/:category/new' => 'posts#new' # category를 인자로 넘겨줘야한다!
  post '/posts/create'=>'posts#create'
  
  # R 보여주기
  get 'posts/index'
  get '/posts/:category/index' => 'posts#index' # category 별로 분류하기
  get '/posts/:category/index_pic'=> 'posts#index_pic'
  get '/posts/show/:id'=>'posts#show'
 

  # U 수정하기
  get '/posts/edit/:id'=>'posts#edit'
  post '/posts/update/:id'=>'posts#update'
  
  # D 삭제하기
  get '/posts/destroy/:id'=>'posts#destroy'
  
  # 검색하기
  get '/posts/search'
  
  # 나의 게시글
  get '/posts/myReply' => 'posts#myReply'
  
  # 좋아요
  get '/likes/likes_toggle/:id' => "likes#likes_toggle"
  post 'likes/likes_toggle'

  # 싫어요
  get '/hates/hates_toggle/:id' => "hates#hates_toggle"
  post 'hates/hates_toggle'
  
  # 댓글 좋아요
  get '/relikes/likes_toggle/:id' => 'relikes#likes_toggle'
  post 'relikes/likes_toggle'
  
  # 댓글 싫어요
  get '/rehates/hates_toggle/:id' => 'rehates#hates_toggle'
  post 'rehates/hates_toggle'
  
  # 답글 좋아요
  get '/rerelikes/likes_toggle/:id' => 'rerelikes#likes_toggle'
  post 'rerelikes/likes_toggle'
  
  # 답글 싫어요
  get '/rerehates/hates_toggle/:id' => 'rerehates#hates_toggle'
  post 'rerehates/hates_toggle'
  
  #프로필 관련 라우팅
  get '/my_profile', to: 'profiles#show'
  get '/new_profile', to: 'profiles#new'
  get '/create_profile', to: 'profiles#new'
  post '/create_profile', to: 'profiles#create'
  get '/edit_profile', to: 'profiles#edit'
  get '/update_profile', to: 'profiles#edit'
  patch '/update_profile', to: 'profiles#update'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
