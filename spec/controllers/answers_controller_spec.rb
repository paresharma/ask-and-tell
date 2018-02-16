require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  let(:user) { create(:user) }

  let(:question) { create(:question) }

  let(:valid_attributes) { attributes_for(:answer) }

  let(:invalid_attributes) { { description: '' } }

  let(:valid_session) { { user_id: user.id } }

  describe "GET #index" do
    it "returns a success response" do
      create(:answer, question: question)
      get :index,
        params: { question_id: question.id },
        session: valid_session,
        xhr: true
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      answer = create(:answer, question: question)
      get :edit,
        params: { question_id: question.id , id: answer.to_param },
        session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Answer" do
        expect {
          post :create,
            params: {answer: valid_attributes, question_id: question.id },
            session: valid_session,
            xhr: true
        }.to change(Answer, :count).by(1)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create,
          params: { answer: invalid_attributes, question_id: question.id },
          session: valid_session,
          xhr: true
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { description: 'A new description' } }

      it "updates the requested answer" do
        answer = create(:answer, question: question)
        put :update,
          params: {
            id: answer.id,
            answer: new_attributes,
            question_id: question.id
          },
          session: valid_session

        answer.reload
        expect(answer.description).to eq('A new description')
      end

      it "redirects to the question of the answer" do
        answer = create(:answer, question: question)
        put :update,
          params: {
            id: answer.id,
            answer: new_attributes,
            question_id: question.id
          },
          session: valid_session

        expect(response).to redirect_to(question)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        answer = create(:answer, question: question)
        put :update,
          params: {
            id: answer.id,
            answer: invalid_attributes,
            question_id: question.id
          },
          xhr: true,
          session: valid_session

        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested answer" do
      answer = create(:answer, question: question)
      expect {
        delete :destroy,
          params: { id: answer.to_param, question_id: question.id },
          session: valid_session
      }.to change(Answer, :count).by(-1)
    end

    it "redirects to the answers list" do
      answer = create(:answer, question: question)
      delete :destroy,
        params: { id: answer.to_param, question_id: question.id },
        session: valid_session
      expect(response).to redirect_to(question)
    end
  end

end
