class CreateQuestionOptions < ActiveRecord::Migration
  def change
    create_table :question_options do |t|
      t.belongs_to :question
      t.text :text
      t.boolean :correct_flg, :default => false
      t.timestamps
    end
  end
end
