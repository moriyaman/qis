class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question
      t.belongs_to :question_option
      t.integer :time
      t.boolean :correct_flg, :default => false
      t.timestamps
    end
  end
end
