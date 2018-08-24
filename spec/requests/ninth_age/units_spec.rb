require 'swagger_helper'

RSpec.describe 'ninth_age/units', type: :request do

  path '/fr/ninth_age/units/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/units/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/units/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/units/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/units/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/units/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/units/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/army-{army_id}/units' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list units') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/army-{army_id}/units' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list units') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/army-{army_id}/units' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list units') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/army-{army_id}/units' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list units') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/army-{army_id}/units' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list units') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/army-{army_id}/units' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list units') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/army-{army_id}/units' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list units') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/army-{army_id}/units/all' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'show_all unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/army-{army_id}/units/all' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'show_all unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/army-{army_id}/units/all' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'show_all unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/army-{army_id}/units/all' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'show_all unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/army-{army_id}/units/all' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'show_all unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/army-{army_id}/units/all' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'show_all unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/army-{army_id}/units/all' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'show_all unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/army-{army_id}/mounts' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'mounts unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/army-{army_id}/mounts' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'mounts unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/army-{army_id}/mounts' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'mounts unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/army-{army_id}/mounts' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'mounts unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/army-{army_id}/mounts' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'mounts unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/army-{army_id}/mounts' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'mounts unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/army-{army_id}/mounts' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'mounts unit') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end
end
