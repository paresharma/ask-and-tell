require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:user) { create(:user) }

  let(:valid_attributes) { attributes_for(:question) }

  let(:invalid_attributes) { { title: '', description: '' } }

  let(:valid_session) { { user_id: user.id } }

  describe "GET #index" do
    it "returns a success response" do
      create(:question, user: user)
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      question = create(:question, user: user)
      get :show, params: {id: question.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      question = create(:question, user: user)
      get :edit, params: {id: question.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Question" do
        expect {
          post :create, params: {question: valid_attributes}, session: valid_session
        }.to change(Question, :count).by(1)
      end

      it "redirects to the created question" do
        post :create, params: {question: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Question.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {question: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end

    context 'invalid session' do
      it 'redirects to sessions#new' do
        post :create, params: { question: valid_attributes }
        expect(response).to redirect_to('/sessions/new')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { description: Faker::Lorem.paragraph } }

      it "updates the requested question" do
        question = create(:question, user: user)
        put :update, params: {id: question.to_param, question: new_attributes}, session: valid_session
        question.reload
        expect(question.description).to eq(new_attributes[:description])
      end

      it "redirects to the question" do
        question = create(:question, user: user)
        put :update, params: {id: question.to_param, question: valid_attributes}, session: valid_session
        expect(response).to redirect_to(question)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        question = create(:question, user: user)
        put :update, params: {id: question.to_param, question: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested question" do
      question = create(:question, user: user)
      expect {
        delete :destroy, params: {id: question.to_param}, session: valid_session
      }.to change(Question, :count).by(-1)
    end

    it "redirects to the questions list" do
      question = create(:question, user: user)
      delete :destroy, params: {id: question.to_param}, session: valid_session
      expect(response).to redirect_to(questions_url)
    end
  end

end
