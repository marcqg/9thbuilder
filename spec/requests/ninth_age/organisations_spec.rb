require 'swagger_helper'

RSpec.describe 'ninth_age/organisations', type: :request do

  path '/fr/ninth_age/organisations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/organisations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/organisations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/organisations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/organisations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/organisations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/organisations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/army-{army_id}/organisations' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list organisations') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/army-{army_id}/organisations' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list organisations') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/army-{army_id}/organisations' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list organisations') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/army-{army_id}/organisations' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list organisations') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/army-{army_id}/organisations' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list organisations') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/army-{army_id}/organisations' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list organisations') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/army-{army_id}/organisations' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list organisations') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/unit-{unit_id}/organisations' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'unit organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/unit-{unit_id}/organisations' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'unit organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/unit-{unit_id}/organisations' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'unit organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/unit-{unit_id}/organisations' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'unit organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/unit-{unit_id}/organisations' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'unit organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/unit-{unit_id}/organisations' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'unit organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/unit-{unit_id}/organisations' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'unit organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end
end
