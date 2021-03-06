require 'swagger_helper'

RSpec.describe 'ninth_age/magic_items', type: :request do

  path '/fr/ninth_age/magic_items/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '554' }

    get(summary: 'show magic_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/magic_items/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '554' }

    get(summary: 'show magic_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/magic_items/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '554' }

    get(summary: 'show magic_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/magic_items/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '554' }

    get(summary: 'show magic_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/magic_items/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '554' }

    get(summary: 'show magic_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/magic_items/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '554' }

    get(summary: 'show magic_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/magic_items/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '554' }

    get(summary: 'show magic_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/version-{version_id}/ninth-age-magic-items/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }
    let(:page) { '554' }

    get(summary: 'list magic_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/version-{version_id}/ninth-age-magic-items/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }
    let(:page) { '554' }

    get(summary: 'list magic_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/version-{version_id}/ninth-age-magic-items/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }
    let(:page) { '554' }

    get(summary: 'list magic_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/version-{version_id}/ninth-age-magic-items/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }
    let(:page) { '554' }

    get(summary: 'list magic_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/version-{version_id}/ninth-age-magic-items/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }
    let(:page) { '554' }

    get(summary: 'list magic_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/version-{version_id}/ninth-age-magic-items/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }
    let(:page) { '554' }

    get(summary: 'list magic_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/version-{version_id}/ninth-age-magic-items/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }
    let(:page) { '554' }

    get(summary: 'list magic_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/version-{version_id}/magic_items/all' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }

    get(summary: 'all magic_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/version-{version_id}/magic_items/all' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }

    get(summary: 'all magic_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/version-{version_id}/magic_items/all' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }

    get(summary: 'all magic_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/version-{version_id}/magic_items/all' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }

    get(summary: 'all magic_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/version-{version_id}/magic_items/all' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }

    get(summary: 'all magic_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/version-{version_id}/magic_items/all' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }

    get(summary: 'all magic_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/version-{version_id}/magic_items/all' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }

    get(summary: 'all magic_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/magic-item-category-{category_id}/magic_items' do
    # You'll want to customize the parameter types...
    parameter 'category_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:category_id) { '31' }

    get(summary: 'list magic_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/magic-item-category-{category_id}/magic_items' do
    # You'll want to customize the parameter types...
    parameter 'category_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:category_id) { '31' }

    get(summary: 'list magic_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/magic-item-category-{category_id}/magic_items' do
    # You'll want to customize the parameter types...
    parameter 'category_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:category_id) { '31' }

    get(summary: 'list magic_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/magic-item-category-{category_id}/magic_items' do
    # You'll want to customize the parameter types...
    parameter 'category_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:category_id) { '31' }

    get(summary: 'list magic_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/magic-item-category-{category_id}/magic_items' do
    # You'll want to customize the parameter types...
    parameter 'category_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:category_id) { '31' }

    get(summary: 'list magic_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/magic-item-category-{category_id}/magic_items' do
    # You'll want to customize the parameter types...
    parameter 'category_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:category_id) { '31' }

    get(summary: 'list magic_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/magic-item-category-{category_id}/magic_items' do
    # You'll want to customize the parameter types...
    parameter 'category_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:category_id) { '31' }

    get(summary: 'list magic_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end
end
