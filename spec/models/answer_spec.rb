require 'rails_helper'

RSpec.describe Answer, type: :model do
  context 'permission' do
    it 'can be administered only by the creator' do
      not_user = create(:user)
      answer =  create(:answer)

      expect(answer.can_be_administered_by(answer.user)).to eq true
      expect(answer.can_be_administered_by(not_user)).to eq false
    end
  end
end
