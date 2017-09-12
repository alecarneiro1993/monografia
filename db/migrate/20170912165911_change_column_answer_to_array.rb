class ChangeColumnAnswerToArray < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :answer
    add_column :questions, :answer, :integer, array:true, :default => []
  end
end
