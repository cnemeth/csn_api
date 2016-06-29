require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  describe 'GET /api/v1/users' do
    let(:users) { create_list(:user, 2) }

    before { @users = users }

    it 'returns all users as json' do
      get '/api/v1/users'
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to be_a_kind_of Hash
      expect(JSON.parse(response.body)['data'].count).to eq 2
    end
  end

  describe 'GET /api/v1/users/:id' do
    let(:user) { create(:user) }

    before { @users = [user] }

    it 'returns user with :id' do
      get "/api/v1/users/#{user.id}" do
        expect(JSON.parse(response.body)['data']['attributes']['first-name']).to eq user.first_name
      end
    end
  end
end
