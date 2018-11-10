require 'rails_helper'

RSpec.describe "Dogs", type: :request do
  describe "GET /dogs" do
    it "works! (now write some real specs)" do
      get dogs_path
      expect(response).to have_http_status(200)
    end
  end

    it "gets a list of Dogs" do
      Dog.create(name: 'Felix', age: 2, enjoys: 'Walks in the park')

          # Make a request to the API
          get '/dogs'

          # Convert the response into a Ruby Hash
          json = JSON.parse(response.body)

          # Assure that we got a successful response
          expect(response).to be_success

          # Assure that we got one result back as expected
          expect(json.length).to eq 1
    end
end
