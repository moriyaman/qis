class TestsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @categories = Category.all 
  end

  def start
    @question = Question.category_id_is(params[:category_id]).last
    @category_id = params[:category_id]
    @question_options = @question.question_options
  end
end
