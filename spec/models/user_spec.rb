require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.from_omniauth' do
    it 'defines it' do
      expect(defined?(User.from_omniauth)).to eq 'method'
    end

    it 'creates new user but only once' do
      new_user = attributes_for(:user)
      auth = double(
        :auth,
        provider: new_user[:provider],
        uid: new_user[:uid],
        info: double(:info, name: new_user[:name]),
        credentials: double(
          :credentials,
          token: new_user[:oauth_token],
          expires_at: new_user[:oauth_expires_at]
        ),
      )

      expect { User.from_omniauth(auth) }.to change(User, :count).by(1)
      expect { User.from_omniauth(auth) }.to change(User, :count).by(0)
    end
  end
end
