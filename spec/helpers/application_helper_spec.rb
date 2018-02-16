require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'Mark up' do
    it 'returns mark up for mark down' do
      expect(helper.markup('## H2')).to eq("<h2>H2</h2>\n")
    end
  end
end
