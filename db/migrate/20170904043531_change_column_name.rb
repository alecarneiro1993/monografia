class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :questions, :question_images, :images
  end
end
