class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :category
      t.text :question
      t.belongs_to :question_type
      t.text :answer
      t.text :option1
      t.text :option2
      t.text :option3
      t.belongs_to :user
      t.belongs_to :reference
      t.timestamps
    end
  end
end
