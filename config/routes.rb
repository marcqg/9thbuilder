Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  localized do
    #filter :locale, exclude: %r{^/admin}

    resources :legals,              only: [:index]

    # token auth routes available at /api/v1/auth
    namespace :api do
      namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks, :registrations, :passwords, :confirmations, :unlocks, :token_validations]

        namespace :builder do
          resources :army_lists,  only: [:index]
        end
      end
    end

    ActiveAdmin.routes(self)
    devise_for :users

    get 'army_lists/:uuid.pdf',                   to: redirect('/buildder/army_lists/%{id}/export-full-magics.pdf')
    get 'army_lists/:uuid/export-:verbosity-:magics', to: redirect('/buildder/army_lists/%{id}/export-%{verbosity}-%{magics}')

    namespace :builder do
      get 'army_lists/:uuid.pdf',                 to: redirect('/army_lists/%{id}/export-full-magics.pdf'), as: :export_full_army_list
      get 'army_lists/:uuid/export-:verbosity-:magics' => 'exports#export',             as: :export_army_list
      get 'army_lists/:uuid/export-txt',          to: 'exports#export_txt',             as: :export_txt_army_list

      resources :army_lists,            only: [:index]

      scope :searchs do
        get '/',                                  to: 'searchs#index',                  as: :searchs
        post '/',                                 to: 'searchs#create',                 as: :searchs
        get '/results-:army_id-:min-:max-:page',  to: 'searchs#show',                   as: :search_results
      end

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

      resources :domain_magics,         only: [:show]
      resources :domain_magic_spells,   only: [:show]
      resources :armies,                only: [:show]
      resources :army_organisations,    only: [:show]
      resources :organisations,         only: [:show]
      resources :organisation_groups,   only: [:show]
      resources :units,                 only: [:show]
      resources :troops,                only: [:show]
      resources :troop_types,           only: [:index, :show]
      resources :unit_types,            only: [:index, :show]
      resources :special_rules,         only: [:show]
      resources :equipments,            only: [:show]

      resources :magic_item_categories, only: [:show]
      resources :magic_items,           only: [:show]
      resources :extra_item_categories, only: [:show]
      resources :extra_items,           only: [:show]
      resources :magic_standards,       only: [:show]

      scope '/army-:army_id' do
        resources :army_organisations,  only: [:index]
        resources :organisations,       only: [:index]
        resources :units,               only: [:index]
        get '/units/all',               to: 'units#show_all',                 as: :units_by_army
        get '/mounts',                  to: 'units#mounts'          ,         as: :mounts_by_army
        get '/special_rules/all',       to: 'special_rules#army_all',         as: :special_rules_by_army
        get '/equipments',              to: 'equipments#army_all',            as: :equipments_by_army
        get '/extra_items',             to: 'extra_items#army_all',           as: :extra_items_by_army
      end

      scope 'extra-item-category-:extra_item_category_id' do
        get '/army-extra_items',             to: 'extra_items#by_army',            as: :extra_items_with_category_by_army
      end

      scope '/domain-magic-:domain_magic_id' do
        resources :domain_magic_spells, only: [:index]
      end

      scope '/units-:unit_id' do
        resources :troops,              only: [:index]
      end

      scope '/unit-:unit_id' do
        resources :troops,              only: [:index]
        resources :unit_options,        only: [:index]
        get '/organisations',           to: 'organisations#unit'
      end

      scope '/version-:version_id' do
        resources :domain_magics,       only: [:index]
        resources :armies,              only: [:index]
        resources :special_rules,       only: [:index]
        resources :equipments,          only: [:index]
        resources :extra_item_categories, only: [:index]
        resources :extra_items,         only: [:index]
        resources :magic_item_categories, only: [:index]
        resources :magic_standards,     only: [:index]

        get '/ninth-age-special-rules/page-:page',    to: 'special_rules#index'
        get '/special_rules/all',                     to: 'special_rules#all'
        get '/ninth-age-equipments/page-:page',       to: 'equipments#index'
        get '/equipments/all',                        to: 'equipments#all'
        get '/ninth-age-extra-items/page-:page',      to: 'extra_items#index'
        get '/extra_items/all',                       to: 'extra_items#all'
        get '/ninth-age-magic-items/page-:page',      to: 'magic_items#all'
        get '/magic_items/all',                       to: 'magic_items#all'
        get '/ninth-age-magic-standards/page-:page',  to: 'magic_standards#index'
        get '/magic_standards/all',                   to: 'magic_standards#all'
      end

      scope '/magic-item-category-:category_id' do
        resources :magic_items,         only: [:index],            as: :magic_items_by_category
      end
    end

    namespace :paint do
      resources :paint_lists
      resources :paint_list_units,                only: [:create, :update, :destroy]
      post '/convert/:army_list_id',                  to: 'paint_lists#convert',           as: :convert_paint_paint_list
    end

    namespace :tournament do
      resources :events, param: :uuid
      resources :organisations,                   only: [:index]
      get '/searchs/users',                       to: 'searchs#users',                    as: :tournament_searchs_users
      resources :myteams,                         only: [:index, :show, :new]
      
      scope '/event-:uuid' do
        scope '/user_applies' do
          post '/multi',                          to: 'user_applies#multi',               as: :multi_user_apply
          post '/sort',                           to: 'user_applies#sort',                as: :sort_user_apply
          get '/add',                             to: 'user_applies#add',                 as: :add_user_apply
        end
        resources :user_applies,                  only: [:new, :edit, :create, :update, :destroy]
        resources :rounds,                        only: [:show, :create]
        resources :custom_points,                 only: [:index, :update]
        resources :exports,                       only: [:index]
        resources :teams

        scope '/round-:round_id' do
          resources :matches,                     only: [:update]
        end
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
