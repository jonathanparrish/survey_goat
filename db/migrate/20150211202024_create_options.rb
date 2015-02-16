class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :order_number
      t.text :option_text
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
