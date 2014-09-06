class ApisController < ApplicationController

  def next_question
    category = Category.find_by(id: params[:category_id])
    @question = category.questions.sample
    @question_options = @question.question_options
    render layout: false
  end

  def finish_test
    test_result = TestResult.new({ 
                    user_id: current_user.id, 
                    category_id: params[:category_id], 
                    point: params[:point] 
                  })
     render json: { result: test_result.save, msg: '' }
  end

  def category_auto_comp
    @categories = Category.name_like(params[:text])
    p @categories
    render layout: false
  end

end
