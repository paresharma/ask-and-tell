require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'return http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      user = create(:user)
      allow(User).to receive(:from_omniauth).and_return(user)
      get :create
      expect(response).to have_http_status(302)
      expect(session[:user_id]).to eq user.id
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      get :destroy
      expect(response).to have_http_status(302)
      expect(session.to_hash).to eq({})
    end
  end
end
