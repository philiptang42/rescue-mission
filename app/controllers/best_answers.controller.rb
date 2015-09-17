class BestAnswersController < ApplicationController
  def update
    @question = Question.find(params[:id])
    if answer.best_answer = false
      answer.best_anser = true
    end
    redirect_to @question
  end
end
