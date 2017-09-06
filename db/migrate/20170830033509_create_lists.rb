class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :title
      t.integer :question_ids, array: true, default: []

      t.timestamps
    end
  end
end
