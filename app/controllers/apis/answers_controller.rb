class Apis::AnswersController < ApplicationController

  def create
    answer = Answer.new({ 
      question_id: params[:question_id], 
      question_option_id: params[:question_option_id], 
      correct_flg: params[:correct_flg],
      time: params[:time]
    })
    
    if params[:correct_flg] == "true"
      # correct version 
      msg = "your answer is correct!"
      point = 10
    else
      # wrong version
      msg = "your answer is wrong"
      point = 0
    end
    render json: { result: answer.save, msg: msg, point: point }
    # ポイントに関しては後ほどいじります
  end

end
