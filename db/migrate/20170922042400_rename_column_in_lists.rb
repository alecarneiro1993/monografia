class RenameColumnInLists < ActiveRecord::Migration[5.1]
  def change
    rename_column :lists, :question_ids, :list_questions
  end
end
