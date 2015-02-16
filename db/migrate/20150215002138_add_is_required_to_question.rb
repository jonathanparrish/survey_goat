class AddIsRequiredToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :is_required, :boolean
  end
end
