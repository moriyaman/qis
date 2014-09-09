class ApisController < ApplicationController

  def next_question
    category = Category.find_by(id: params[:category_id])
    @question = category.questions.sample
    @question_options = @question.question_options
    render layout: false
  end

  def finish_test
    test_result = TestResult.find_or_initialize_by(user_id: current_user.id, category_id: params[:category_id])
    test_result.point = params[:point]
    result = test_result.save
    if result
      Redis.new.zrem("ranking-#{test_result.category_id}", test_result.user_id)
      Redis.new.zadd("ranking-#{test_result.category_id}", test_result.point, test_result.user_id)
    end
    render json: { result: test_result.save, msg: '' }
  end

  def category_auto_comp
    @categories = Category.name_like(params[:text])
    p @categories
    render layout: false
  end

end
