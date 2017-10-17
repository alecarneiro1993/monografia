class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.references :user, foreign_key: true
      t.references :list, foreign_key: true
      t.references :question, foreign_key: true
      t.boolean :correct

      t.timestamps
    end
  end
end
