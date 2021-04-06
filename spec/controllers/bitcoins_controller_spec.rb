require 'rails_helper'

RSpec.describe Api::V1::BitcoinsController, type: :controller do
    before do
        @user = User.create(first_name: "John", last_name: "Smith", email: "johnsmith@gmail.com", password: "supersecret")
    end
    describe 'login with valid JWT Token' do
        it 'fetchs index' do
            request.headers.merge!(authenticated_header(@user))
            get(:index)
            expect(response.status).to eql(200)
            expect(response.message).to eql('OK')
        end
    end
    describe 'login with invalid JWT Token' do
        it 'fetchs index' do
            get(:index)
            expect(response.status).to eql(401)
            expect(response.message).to eql('Unauthorized')
        end
    end
end
