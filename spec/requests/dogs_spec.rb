require 'rails_helper'

RSpec.describe "Dogs", type: :request do
  describe "GET /dogs" do

    it "works! (now write some real specs)" do
      get dogs_path
      expect(response).to have_http_status(200)
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

    it "creates a dog" do
     # The params we are going to send with the request
     dog_params = {
       dog: {
         name: 'Buster',
         age: 4,
         enjoys: 'Eating DOG FOOD THAT IS NOT KIBBLES, and plenty of sunshine.'
       }
     }

     # Send the request to the server
     post '/dogs', params: dog_params

     # Assure that we get a success back
     expect(response).to be_success

     # Look up the dog we expect to be created in the Database
     new_dog = Dog.first

     # Assure that the created dog has the correct attributes
     expect(new_dog.name).to eq('Buster')

    end

    it "doesn't create a dog without a name" do
      dog_params = {
        dog: {
          age: 4,
          enjoys: 'DOG FOOD, and plenty of sunshine.'
        }
      }

      post '/dogs', params: dog_params

      # This is a new test to make sure that our status is correct when the record can't be created
      # You can read more about HTTP response codes here: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
      expect(response.status).to eq 422

      # We also want to check that the API lets us know what is wrong, so the frontend can prompt the user to fix it.
      json = JSON.parse(response.body)
      # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
      expect(json['name']).to include "can't be blank"
    end

  end
end
