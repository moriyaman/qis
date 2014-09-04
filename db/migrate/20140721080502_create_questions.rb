class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :category
      t.text :text
      t.belongs_to :question_type
      t.belongs_to :user
      t.belongs_to :reference
      t.timestamps
    end
  end
end
