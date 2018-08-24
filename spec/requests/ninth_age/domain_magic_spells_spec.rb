require 'swagger_helper'

RSpec.describe 'ninth_age/domain_magic_spells', type: :request do

  path '/fr/ninth_age/domain_magic_spells/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show domain_magic_spell') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/domain_magic_spells/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show domain_magic_spell') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/domain_magic_spells/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show domain_magic_spell') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/domain_magic_spells/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show domain_magic_spell') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/domain_magic_spells/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show domain_magic_spell') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/domain_magic_spells/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show domain_magic_spell') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/domain_magic_spells/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '1' }

    get(summary: 'show domain_magic_spell') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/domain-magic-{domain_magic_id}/domain_magic_spells' do
    # You'll want to customize the parameter types...
    parameter 'domain_magic_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:domain_magic_id) { '1' }

    get(summary: 'list domain_magic_spells') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/domain-magic-{domain_magic_id}/domain_magic_spells' do
    # You'll want to customize the parameter types...
    parameter 'domain_magic_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:domain_magic_id) { '1' }

    get(summary: 'list domain_magic_spells') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/domain-magic-{domain_magic_id}/domain_magic_spells' do
    # You'll want to customize the parameter types...
    parameter 'domain_magic_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:domain_magic_id) { '1' }

    get(summary: 'list domain_magic_spells') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/domain-magic-{domain_magic_id}/domain_magic_spells' do
    # You'll want to customize the parameter types...
    parameter 'domain_magic_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:domain_magic_id) { '1' }

    get(summary: 'list domain_magic_spells') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/domain-magic-{domain_magic_id}/domain_magic_spells' do
    # You'll want to customize the parameter types...
    parameter 'domain_magic_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:domain_magic_id) { '1' }

    get(summary: 'list domain_magic_spells') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/domain-magic-{domain_magic_id}/domain_magic_spells' do
    # You'll want to customize the parameter types...
    parameter 'domain_magic_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:domain_magic_id) { '1' }

    get(summary: 'list domain_magic_spells') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/domain-magic-{domain_magic_id}/domain_magic_spells' do
    # You'll want to customize the parameter types...
    parameter 'domain_magic_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:domain_magic_id) { '1' }

    get(summary: 'list domain_magic_spells') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end
end
