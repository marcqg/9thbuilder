require 'swagger_helper'

RSpec.describe 'ninth_age/armies', type: :request do

  path '/fr/ninth_age/armies/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show army') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/armies/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show army') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/armies/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show army') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/armies/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show army') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/armies/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show army') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/armies/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show army') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/armies/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show army') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/version-{version_id}/armies' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '1' }

    get(summary: 'list armies') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/version-{version_id}/armies' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '1' }

    get(summary: 'list armies') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/version-{version_id}/armies' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '1' }

    get(summary: 'list armies') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/version-{version_id}/armies' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '1' }

    get(summary: 'list armies') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/version-{version_id}/armies' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '1' }

    get(summary: 'list armies') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/version-{version_id}/armies' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '1' }

    get(summary: 'list armies') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/version-{version_id}/armies' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '1' }

    get(summary: 'list armies') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end
end
