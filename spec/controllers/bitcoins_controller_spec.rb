require 'rails_helper'

RSpec.describe Api::V1::BitcoinsController, type: :controller do
    describe '#index' do 
        before do
            user = User.create(first_name: "John", last_name: "Smith", email: "johnsmith@gmail.com", password: "supersecret")
            request.session[:user_id] = user.id
        end
        it 'render the index json' do
            get(:index)
            response.body == Bitcoin.all.order(created_at: :DESC).to_json
        end
    end
end
