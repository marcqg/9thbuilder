require 'swagger_helper'

RSpec.describe 'ninth_age/army_organisations', type: :request do

  path '/fr/ninth_age/army_organisations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show army_organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/army_organisations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show army_organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/army_organisations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show army_organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/army_organisations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show army_organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/army_organisations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show army_organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/army_organisations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show army_organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/army_organisations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show army_organisation') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/army-{army_id}/army_organisations' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list army_organisations') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/army-{army_id}/army_organisations' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list army_organisations') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/army-{army_id}/army_organisations' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list army_organisations') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/army-{army_id}/army_organisations' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list army_organisations') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/army-{army_id}/army_organisations' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list army_organisations') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/army-{army_id}/army_organisations' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list army_organisations') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/army-{army_id}/army_organisations' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '1' }

    get(summary: 'list army_organisations') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end
end
