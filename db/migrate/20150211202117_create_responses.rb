class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :response_text
      t.integer :question_id
      t.integer :submission_id

      t.timestamps null: false
    end
  end
end
