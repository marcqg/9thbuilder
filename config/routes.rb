Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  localized do
    #filter :locale, exclude: %r{^/admin}

    ActiveAdmin.routes(self)
    devise_for :users

    get 'army_lists/:uuid.pdf', to: redirect('/buildder/army_lists/%{id}/export-full-magics.pdf')
    get 'army_lists/:uuid/export-:verbosity-:magics', to: redirect('/buildder/army_lists/%{id}/export-%{verbosity}-%{magics}')

    namespace :builder do
      get 'army_lists/:uuid.pdf', to: redirect('/army_lists/%{id}/export-full-magics.pdf'), as: :export_full_army_list
      get 'army_lists/:uuid/export-:verbosity-:magics' => 'exports#export', as: :export_army_list

      resources :army_lists,          only: [:index]

      resources :army_lists, param: :uuid do
        get 'delete', on: :member
        get 'new_from', on: :member
        post 'duplicate', on: :member

        resources :army_list_units do
          get 'delete', on: :member
          get 'new_from', on: :member
          post 'duplicate', on: :member
          post 'sort', on: :collection
        end
      end
    end

    namespace :ninth_age do
      resources :versions,              only: [:index, :show]

      resources :magics,                only: [:show]
      resources :armies,                only: [:show]
      resources :army_organisations,    only: [:show]
      resources :organisations,         only: [:show]
      resources :organisation_groups,   only: [:show]
      resources :units,                 only: [:show]
      resources :troops,                only: [:show]
      resources :troop_types,           only: [:show]
      resources :special_rules,         only: [:show]
      resources :equipments,            only: [:show]

      resources :magic_items,           only: [:show]
      resources :extra_items,           only: [:show]
      resources :magic_standards,       only: [:show]

      scope '/army-:army_id' do
        resources :army_organisations,  only: [:index]
      end

      scope '/units-:unit_id' do
        resources :troops,  only: [:index]
      end

      scope '/version-:version_id' do
        resources :magics,              only: [:index]
        resources :armies,              only: [:index]
        resources :special_rules,       only: [:index]
        resources :equipments,          only: [:index]
        resources :extra_items,         only: [:index]
        resources :magic_items,         only: [:index]
        resources :magic_standards,     only: [:index]

        get '/ninth-age-special-rules/page-:page',    to: 'special_rules#index'
        get '/ninth-age-equipments/page-:page',       to: 'equipments#index'
        get '/ninth-age-extra-items/page-:page',      to: 'extra_items#index'
        get '/ninth-age-magic-items/page-:page',      to: 'magic_items#index'
        get '/ninth-age-magic-standards/page-:page',  to: 'magic_standards#index'
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
