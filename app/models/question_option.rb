class QuestionOption < ActiveRecord::Base

  belongs_to :question
  has_many :answers

  def is_correct?
    correct_flg
  end
end
