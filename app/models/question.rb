class Question < ActiveRecord::Base

  scope :category_id_is, -> category_id { where(category_id: category_id) }
  
  belongs_to :category
  has_many :question_options
  has_many :answers

  accepts_nested_attributes_for :question_options

  validates :text, presence: true
  validates :category_id, presence: true,
    :uniqueness => {:scope => [:text]},
                    :if => Proc.new{|f| f.new_record?}
  validates :user_id, presence: true
  
end
