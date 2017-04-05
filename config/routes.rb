Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  localized do
    #filter :locale, exclude: %r{^/admin}

    ActiveAdmin.routes(self)
    devise_for :users

    get 'army_lists/:uuid.pdf', to: redirect('/army_lists/%{id}/export-full-magics.pdf')
    get 'army_lists/:uuid/export-:verbosity-:magics' => 'army_lists#export', as: :export_army_list

    resources :army_lists, param: :uuid do
      get 'delete', on: :member
      get 'export', on: :member
      get 'new_from', on: :member
      post 'duplicate', on: :member

      resources :army_list_units do
        get 'delete', on: :member
        get 'new_from', on: :member
        post 'duplicate', on: :member
        post 'sort', on: :collection
      end
    end

    namespace :ninth_age do
      resources :versions,  only: [:index, :show]

      resources :magics,  only: [:index]

      scope '/version-:version_id' do
        resources :magics,  only: [:show]
      end
    end

    # You can have the root of your site routed with "root"
    root 'home#index'
  end


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
