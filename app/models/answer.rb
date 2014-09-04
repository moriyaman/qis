class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :question_option

  def is_correct?
    correct_flg
  end
 
end
