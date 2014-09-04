class ApisController < ApplicationController

  def next_question
    category = Category.find_by(id: params[:category_id])
    @question = category.questions.sample
    @question_options = @question.question_options
    render layout: false
  end

end
