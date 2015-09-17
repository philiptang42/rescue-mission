class AnswersController < ApplicationController

  def index
    @answer = Answer.new
    @answers = Answer.all
  end

  def show
    @answer = Answer.new
    @answers = Answer.all
  end

  def new
    @question = Question.find(params[:question_id])
    @answers = Answer.all
    @answer = Answer.new
  end

  def update
     @answer = Answer.find(params[:id])
     @question = @answer.question
     @question.answers.each do |answer|
       answer.update(best_answer: false)
     end
     @answer.update(best_answer: true)
     redirect_to @question
     flash[:notice] = 'THE BEST'
   end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash[:notice] = 'Answer added.'
      redirect_to question_path(@question)
    else
      flash[:notice] = 'MUST BE LENGTHIER.'
      redirect_to question_path(@question)
    end
  end


  protected
  def answer_params
    params.require(:answer).permit(:body)
  end

end
