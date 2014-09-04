class Question < ActiveRecord::Base

  scope :category_id_is, -> category_id { where(category_id: category_id) }
  
  belongs_to :category
  has_many :question_options
  has_many :answers
end
