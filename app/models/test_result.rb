class TestResult < ActiveRecord::Base

  include TestRanking

  belongs_to :user
  belongs_to :category

  scope :category_id_is, -> category_id { where(category_id: category_id) }

end
