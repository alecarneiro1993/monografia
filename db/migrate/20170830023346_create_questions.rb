class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.json :question_images
      t.json :answer

      t.timestamps
    end
  end
end
