class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :order_number
      t.string :question_type
      t.text :question_text
      t.text :description
      t.integer :survey_id

      t.timestamps null: false
    end
  end
end
