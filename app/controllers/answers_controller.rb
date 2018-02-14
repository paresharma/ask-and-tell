class AnswersController < ApplicationController
  before_action :login_required, except: [:index]
  before_action :set_answer, only: [:edit, :update, :destroy]

  def index
    set_page_and_extract_portion_from(
      Question.find(params[:question_id]).answers,
      per_page: [5, 10, 15]
    )
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = params[:question_id]

    @_ok =  @answer.save
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer.question, notice: 'Answer was successfully updated.'
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question, notice: 'Answer was successfully destroyed.'
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:description)
  end
end
