require 'swagger_helper'

RSpec.describe 'ninth_age/special_rules', type: :request do

  path '/fr/ninth_age/special_rules/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '2' }

    get(summary: 'show special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/special_rules/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '2' }

    get(summary: 'show special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/special_rules/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '2' }

    get(summary: 'show special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/special_rules/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '2' }

    get(summary: 'show special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/special_rules/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '2' }

    get(summary: 'show special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/special_rules/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '2' }

    get(summary: 'show special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/special_rules/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '2' }

    get(summary: 'show special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/army-{army_id}/special_rules/all' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '2' }

    get(summary: 'army_all special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/army-{army_id}/special_rules/all' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '2' }

    get(summary: 'army_all special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/army-{army_id}/special_rules/all' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '2' }

    get(summary: 'army_all special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/army-{army_id}/special_rules/all' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '2' }

    get(summary: 'army_all special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/army-{army_id}/special_rules/all' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '2' }

    get(summary: 'army_all special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/army-{army_id}/special_rules/all' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '2' }

    get(summary: 'army_all special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/army-{army_id}/special_rules/all' do
    # You'll want to customize the parameter types...
    parameter 'army_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:army_id) { '2' }

    get(summary: 'army_all special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/version-{version_id}/special_rules' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }

    get(summary: 'list special_rules') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/version-{version_id}/special_rules' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }

    get(summary: 'list special_rules') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/version-{version_id}/special_rules' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }

    get(summary: 'list special_rules') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/version-{version_id}/special_rules' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }

    get(summary: 'list special_rules') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/version-{version_id}/special_rules' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }

    get(summary: 'list special_rules') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/version-{version_id}/special_rules' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }

    get(summary: 'list special_rules') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/version-{version_id}/special_rules' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }

    get(summary: 'list special_rules') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/version-{version_id}/ninth-age-special-rules/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }
    let(:page) { '2' }

    get(summary: 'list special_rules') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/version-{version_id}/ninth-age-special-rules/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }
    let(:page) { '2' }

    get(summary: 'list special_rules') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/version-{version_id}/ninth-age-special-rules/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }
    let(:page) { '2' }

    get(summary: 'list special_rules') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/version-{version_id}/ninth-age-special-rules/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }
    let(:page) { '2' }

    get(summary: 'list special_rules') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/version-{version_id}/ninth-age-special-rules/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }
    let(:page) { '2' }

    get(summary: 'list special_rules') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/version-{version_id}/ninth-age-special-rules/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }
    let(:page) { '2' }

    get(summary: 'list special_rules') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/version-{version_id}/ninth-age-special-rules/page-{page}' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    parameter 'page', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }
    let(:page) { '2' }

    get(summary: 'list special_rules') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/fr/ninth_age/version-{version_id}/special_rules/all' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }

    get(summary: 'all special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/de/ninth_age/version-{version_id}/special_rules/all' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }

    get(summary: 'all special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ko/ninth_age/version-{version_id}/special_rules/all' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }

    get(summary: 'all special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/pl/ninth_age/version-{version_id}/special_rules/all' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }

    get(summary: 'all special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/es/ninth_age/version-{version_id}/special_rules/all' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }

    get(summary: 'all special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/it/ninth_age/version-{version_id}/special_rules/all' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }

    get(summary: 'all special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/ninth_age/version-{version_id}/special_rules/all' do
    # You'll want to customize the parameter types...
    parameter 'version_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:version_id) { '2' }

    get(summary: 'all special_rule') do
      produces 'application/json'
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end
end
