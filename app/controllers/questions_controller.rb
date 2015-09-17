class QuestionsController < ApplicationController

  def index
    @question = Question.new
    @questions = Question.all.order ('created_at DESC')
  end

  def delete
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question added.'
      redirect_to '/questions'
    else
      flash[:notice] = 'Invalid entry.'
      redirect_to '/questions'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
      if @question.update(question_params)
        redirect_to @question, notice: "Question Updated"
      else
        redirect_to @question, notice: "Edit Rejected"
      end
    end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = 'Question destroyed'
    redirect_to root_path
  end

  def show
    @question = Question.find(params[:id])
    @new_answer = Answer.new
    @answers = Answer.where(question_id: @question.id).order('best_answer desc', 'created_at desc')
    render :show
  end

  # def best_answer
  #   @question = Question.find(params[:id])
  #   if answer.best_answer = false
  #     answer.best_anser = true
  #   end
  #   redirect_to @question
  # end

  protected
  def question_params
    params.require(:question).permit(:title, :description, :user_attributes)
  end


end
