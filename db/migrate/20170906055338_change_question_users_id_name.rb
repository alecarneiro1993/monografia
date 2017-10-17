class ChangeQuestionUsersIdName < ActiveRecord::Migration[5.1]
  def change
    rename_column :questions, :users_id, :user_id
  end
end
