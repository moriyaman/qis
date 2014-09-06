class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :point
      t.timestamps
    end
  end
end
