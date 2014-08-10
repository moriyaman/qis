class CreateQuestionPacks < ActiveRecord::Migration
  def change
    create_table :question_packs do |t|
      t.belongs_to :question
      t.belongs_to :pack
      t.timestamps
    end
  end
end
