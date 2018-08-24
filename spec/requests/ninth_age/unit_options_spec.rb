require 'swagger_helper'

RSpec.describe 'ninth_age/unit_options', type: :request do

  path '/fr/ninth_age/unit-{unit_id}/unit_options' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list unit_options') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/unit-{unit_id}/unit_options' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list unit_options') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/unit-{unit_id}/unit_options' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list unit_options') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/unit-{unit_id}/unit_options' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list unit_options') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/unit-{unit_id}/unit_options' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list unit_options') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/unit-{unit_id}/unit_options' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list unit_options') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/unit-{unit_id}/unit_options' do
    # You'll want to customize the parameter types...
    parameter 'unit_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:unit_id) { '1' }

    get(summary: 'list unit_options') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end
end
