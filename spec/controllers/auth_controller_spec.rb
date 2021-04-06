require 'rails_helper'

RSpec.describe AuthController, type: :controller do
    before do
        user = User.create(first_name: "John", last_name: "Smith", email: "johnsmith@gmail.com", password: "supersecret")
    end
    describe 'login ' do 
        it 'with valid params' do
            post(:login, params: {'email':'johnsmith@gmail.com','password':'supersecret'})
            expect(response.status).to eql(200)
            expect(response.body).to include('success')
        end
        it 'with invalid params' do
            post(:login, params: {'email':'johnsmith@gmail.com','password':'password'})
            expect(response.status).to eql(200)
            expect(response.body).to include('failure')
        end
    end
end