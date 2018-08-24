require 'swagger_helper'

RSpec.describe 'ninth_age/troops', type: :request do

  path '/fr/ninth_age/troops/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show troop') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/troops/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show troop') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/troops/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show troop') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/troops/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show troop') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/troops/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show troop') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/troops/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show troop') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/troops/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show troop') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/units-{unit_id}/troops' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list troops') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/units-{unit_id}/troops' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list troops') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/units-{unit_id}/troops' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list troops') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/units-{unit_id}/troops' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list troops') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/units-{unit_id}/troops' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list troops') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/units-{unit_id}/troops' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list troops') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/units-{unit_id}/troops' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list troops') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/unit-{unit_id}/troops' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list troops') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/unit-{unit_id}/troops' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list troops') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/unit-{unit_id}/troops' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list troops') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/unit-{unit_id}/troops' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list troops') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/unit-{unit_id}/troops' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list troops') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/unit-{unit_id}/troops' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list troops') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/unit-{unit_id}/troops' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list troops') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end
end
