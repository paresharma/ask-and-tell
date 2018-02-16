require 'rails_helper'

RSpec.describe Question, type: :model do
  describe '.search' do
    before do
      create_list(:question, 25)
      create(:question, title: 'This is a searchable title')
      create(:question, description: 'This is a searchable description')
    end

    it 'should return all' do
      questions = Question.search
      expect(questions.size).to eq 27
    end

    it 'should perform full text search on :title and :description' do
      questions = Question.search('searchable')
      expect(questions.size).to eq 2
    end
  end

  context 'permission' do
    it 'can be administered only by the creator' do
      not_user = create(:user)
      question =  create(:question)

      expect(question.can_be_administered_by(question.user)).to eq true
      expect(question.can_be_administered_by(not_user)).to eq false
    end
  end
end
