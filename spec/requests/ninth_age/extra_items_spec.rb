require 'swagger_helper'

RSpec.describe 'ninth_age/extra_items', type: :request do

  path '/fr/ninth_age/extra_items/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/extra_items/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/extra_items/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/extra_items/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/extra_items/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/extra_items/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/extra_items/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/army-{army_id}/extra_items' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '47' }

    get(summary: 'army_all extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/army-{army_id}/extra_items' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '47' }

    get(summary: 'army_all extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/army-{army_id}/extra_items' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '47' }

    get(summary: 'army_all extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/army-{army_id}/extra_items' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '47' }

    get(summary: 'army_all extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/army-{army_id}/extra_items' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '47' }

    get(summary: 'army_all extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/army-{army_id}/extra_items' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '47' }

    get(summary: 'army_all extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/army-{army_id}/extra_items' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '47' }

    get(summary: 'army_all extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/extra-item-category-{extra_item_category_id}/army-extra_items' do
    # You'll want to customize the parameter types...
    parameter 'extra_item_category_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:extra_item_category_id) { '15' }

    get(summary: 'by_army extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/extra-item-category-{extra_item_category_id}/army-extra_items' do
    # You'll want to customize the parameter types...
    parameter 'extra_item_category_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:extra_item_category_id) { '15' }

    get(summary: 'by_army extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/extra-item-category-{extra_item_category_id}/army-extra_items' do
    # You'll want to customize the parameter types...
    parameter 'extra_item_category_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:extra_item_category_id) { '15' }

    get(summary: 'by_army extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/extra-item-category-{extra_item_category_id}/army-extra_items' do
    # You'll want to customize the parameter types...
    parameter 'extra_item_category_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:extra_item_category_id) { '15' }

    get(summary: 'by_army extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/extra-item-category-{extra_item_category_id}/army-extra_items' do
    # You'll want to customize the parameter types...
    parameter 'extra_item_category_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:extra_item_category_id) { '15' }

    get(summary: 'by_army extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/extra-item-category-{extra_item_category_id}/army-extra_items' do
    # You'll want to customize the parameter types...
    parameter 'extra_item_category_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:extra_item_category_id) { '15' }

    get(summary: 'by_army extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/extra-item-category-{extra_item_category_id}/army-extra_items' do
    # You'll want to customize the parameter types...
    parameter 'extra_item_category_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:extra_item_category_id) { '15' }

    get(summary: 'by_army extra_item') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/version-{version_id}/extra_items' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }

    get(summary: 'list extra_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/version-{version_id}/extra_items' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }

    get(summary: 'list extra_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/version-{version_id}/extra_items' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }

    get(summary: 'list extra_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/version-{version_id}/extra_items' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }

    get(summary: 'list extra_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/version-{version_id}/extra_items' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }

    get(summary: 'list extra_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/version-{version_id}/extra_items' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }

    get(summary: 'list extra_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/version-{version_id}/extra_items' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }

    get(summary: 'list extra_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/version-{version_id}/ninth-age-extra-items/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }
    let(:page) { '1' }

    get(summary: 'list extra_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/version-{version_id}/ninth-age-extra-items/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }
    let(:page) { '1' }

    get(summary: 'list extra_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/version-{version_id}/ninth-age-extra-items/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }
    let(:page) { '1' }

    get(summary: 'list extra_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/version-{version_id}/ninth-age-extra-items/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }
    let(:page) { '1' }

    get(summary: 'list extra_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/version-{version_id}/ninth-age-extra-items/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }
    let(:page) { '1' }

    get(summary: 'list extra_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/version-{version_id}/ninth-age-extra-items/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }
    let(:page) { '1' }

    get(summary: 'list extra_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/version-{version_id}/ninth-age-extra-items/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '3' }
    let(:page) { '1' }

    get(summary: 'list extra_items') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end
end
